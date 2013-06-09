(*
  PressObjects, PostgreSQL database Broker
  Copyright (C) 2008 Laserpress Ltda.

  http://www.pressobjects.org

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit PressMySQLBroker;

{$I Press.inc}

interface

uses
  PressOPFClasses,
  PressOPFStorage,
  PressConsts,
  PressOPFSQLBuilder;

type
  TPressMySQLDDLBuilder = class(TPressOPFDDLBuilder)
  protected
    function InternalFieldTypeStr(AFieldType: TPressOPFFieldType): string; override;
    function InternalImplicitIndexCreation: Boolean; override;
    function InternalMaxIdentLength: Integer; override;

  public
    function CreateGeneratorStatement(const AName: string): string; override;
    function SelectGeneratorStatement: string; override;
    function CreateTableStatement(ATableMetadata: TPressOPFTableMetadata): string; override;
    function CreateDatabaseStatement(AModel: TPressOPFStorageModel): string; override;
    function CreateMySqlAutoIncrement(ATableMetadata: TPressOPFTableMetadata): string; virtual;
  end;

implementation

uses
  SysUtils;

{ TPressMySQLDDLBuilder }

function TPressMySQLDDLBuilder.CreateDatabaseStatement(
  AModel: TPressOPFStorageModel): string;
var
  VTable: TPressOPFTableMetadata;
  I, J: Integer;
begin
  Result := '';
  for I := 0 to Pred(AModel.TableMetadatas.GeneratorList.Count) do
    Result := Result +
     CreateGeneratorStatement(AModel.TableMetadatas.GeneratorList[I]) + ';' +
     SPressLineBreak + SPressLineBreak;
  for I := 0 to Pred(AModel.TableMetadatas.Count) do
  begin
    VTable := AModel.TableMetadatas[I];
    Result := Result +
     CreateTableStatement(VTable) +
     CreatePrimaryKeyStatement(VTable)+
     CreateMySqlAutoIncrement(VTable);
     
    for J := 0 to Pred(VTable.IndexCount) do
      Result := Result + CreateIndexStatement(VTable, VTable.Indexes[J]);
    if not InternalImplicitIndexCreation then
      for J := 0 to Pred(VTable.ForeignKeyCount) do
        Result := Result +
         CreateForeignKeyIndexStatement(VTable, VTable.ForeignKeys[J]);
  end;
  for I := 0 to Pred(AModel.TableMetadatas.Count) do
  begin
    VTable := AModel.TableMetadatas[I];
    for J := 0 to Pred(VTable.ForeignKeyCount) do
      Result := Result +
       CreateForeignKeyStatement(VTable, VTable.ForeignKeys[J]);
  end;
end;

function TPressMySQLDDLBuilder.CreateGeneratorStatement(const AName: string): string;
begin
  Result := '';
end;

function TPressMySQLDDLBuilder.CreateMySqlAutoIncrement(
  ATableMetadata: TPressOPFTableMetadata): string;
var
  indx, i : Integer;
begin
  indx := 999999999;
  if Assigned(ATableMetadata.PrimaryKey) then
  begin
    for i := 0 to ATableMetadata.FieldCount do
    begin
      if ATableMetadata.Fields[i].Name = BuildStringList(ATableMetadata.PrimaryKey.FieldNames) then
      begin
        indx := i;
        Break;
      end;
    end;
    if indx <> 999999999 then
    begin
      Result := Format(
      'alter table %s change ' + SPressLineBreak +
      '  %s %s %s auto_increment not null;' + SPressLineBreak + SPressLineBreak, [
      ATableMetadata.Name,
      BuildStringList(ATableMetadata.PrimaryKey.FieldNames),
      BuildStringList(ATableMetadata.PrimaryKey.FieldNames),
      BuildFieldType(ATableMetadata.Fields[indx])]);
    end;
  end
  else
    Result := '';
end;

function TPressMySQLDDLBuilder.CreateTableStatement(
  ATableMetadata: TPressOPFTableMetadata): string;
begin
  Result := Format(
   'create table %s (' + SPressLineBreak +
   '  %s);' + SPressLineBreak + SPressLineBreak, [
   ATableMetadata.Name,
   CreateFieldStatementList(ATableMetadata)]);
end;

function TPressMySQLDDLBuilder.InternalFieldTypeStr(
  AFieldType: TPressOPFFieldType): string;
const
  CFieldTypeStr: array[TPressOPFFieldType] of string = (
   '',                  //  oftUnknown
   'varchar',           //  oftPlainString
   'varchar',           //  oftAnsiString
   'smallint',          //  oftInt16
   'int',               //  oftInt32
   'bigint',            //  oftInt64
   'double',            //  oftDouble
   'real',             //  oftCurrency
   'char',           //  oftBoolean
   'date',              //  oftDate
   'time',              //  oftTime
   'timestamp',         //  oftDateTime
   'text',              //  oftMemo
   'binary');            //  oftBinary
begin
  Result := CFieldTypeStr[AFieldType];
end;

function TPressMySQLDDLBuilder.InternalImplicitIndexCreation: Boolean;
begin
  Result := True;
end;

function TPressMySQLDDLBuilder.InternalMaxIdentLength: Integer;
begin
  Result := 63;
end;

function TPressMySQLDDLBuilder.SelectGeneratorStatement: string;
begin
  Result := '';
end;

end.
