program Christmas tree;

var inputNumberRows,inputNumberTriangles,triangleIndex:integer;

// draw spases
procedure drawSpaces (spaceCount:integer);
var i:integer;
begin
    for i := 0 to spaceCount - 1 do write(' ');
end;

// draw asterisks
procedure drawAsterisks (asterisksCount:integer);
var i:integer;
begin
    for i := 0 to asterisksCount - 1 do write('*');
end;

// draw triangle
procedure drawTriangele(rowCount:integer);
var i: integer;
begin
    for i := 0 to rowCount - 1 do
    begin
        drawSpaces(rowCount - i);
        drawAsterisks(i * 2 + 1);
        writeln();
    end;   
end;

begin
    write('Enter numbers of triangles: ');
    readln(inputNumberTriangles);
    write('Enter numbers of rows in the triangle: ');
    readln(inputNumberRows);
    writeln('');

    // the loop prints the number of triangles to the console
    for triangleIndex := 0 to inputNumberTriangles - 1 do
    begin
        drawTriangele(inputNumberRows);
    end;

    drawSpaces(inputNumberRows);
    writeln('*');
    drawSpaces(inputNumberRows);
    writeln('*');
end.

