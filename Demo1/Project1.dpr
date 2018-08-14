program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'BarMenus Demo1';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
