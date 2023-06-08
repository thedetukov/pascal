program Bytecount;

{$MODE OBJFPC} // directive to support exceptions

uses sysutils; // required module

type Array256Integer = array [0..255] of integer;
     ArrayByte = array of byte;

function readFile(inputFileName:string): ArrayByte;
var
    fileData: ArrayByte;
    indexArray: integer;
    inputFileDataLen: integer;
    inputFile: file of byte;
    value: byte;
begin
    assign(inputFile, inputFileName);
    reset(inputFile);

    inputFileDataLen := FileSize(inputFile);
    SetLength(fileData, inputFileDataLen);

    for indexArray:=0 to inputFileDataLen - 1 do
    begin
        read(inputFile, value);
        fileData[indexArray] := value;
    end;

    readFile := fileData;
end;

function countBytesOccurrence(data:array of byte): Array256Integer;
var resultCountBytesOccurrence: Array256Integer;
    indexArray: integer;
    dataLen: integer;
    indexbyte: byte;
begin
    // fill array by zeros
    for indexArray := 0 to 255 do resultCountBytesOccurrence[indexArray] := 0;

    dataLen := length(data);
    for indexArray :=  0 to dataLen - 1 do
    begin
        indexbyte := data[indexArray];
        resultCountBytesOccurrence[indexbyte] := resultCountBytesOccurrence[indexbyte] + 1;
    end;
    countBytesOccurrence := resultCountBytesOccurrence;
end;

var fileData: ArrayByte;
    appResult: Array256Integer;
    inputUserFileName: string;
    i: integer;
    value: integer;
    message: string;
begin
    try
        write(StdOut, 'Enter file name: ');
        readln(inputUserFileName);
        writeln;
        message := 'Change the file name, the presence of the file,'+#10+
                   'explicit read access.'+#10+
                   '_ _ _ _ _ _ _ _ _ _ _ _ _ _'+#10+
                   'Thanks for used our program.';

        fileData := readFile(inputUserFileName);
        appResult := countBytesOccurrence(fileData);
        writeln;

        for i := 0 to 255 do
        begin
            value := appResult[i];
            writeln('0x',LowerCase(IntToHex(i,2)), ' - ', value);
        end;
  
    except on E: EInOutError do
                writeln(StdErr, 'Can not read ' + inputUserFileName + ' file.'+#10, message);
           on E: Exception do
                writeln(StdErr, 'An unexpected error has occurred in the program, contact the developers.');
    end;
end.
 