unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs, IdHash, IdHashMessageDigest;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label6: TLabel;
    Edit6: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  inp:TextFile;

implementation

{$R *.dfm}

uses Unit3;

procedure TForm4.Button1Click(Sender: TObject);
begin
assignfile(inp,ExtractFilePath(Application.ExeName)+'test.txt');
Append(inp);
Writeln(inp);
Writeln(inp,edit1.Text);
Writeln(inp,edit2.Text);
Writeln(inp,edit3.Text);
Writeln(inp,edit4.Text);
Writeln(inp,edit5.Text);
Writeln(inp,RadioGroup1.ItemIndex);
Writeln(inp,OpenPictureDialog1.FileName);
CloseFile(inp);
Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
RadioGroup1.ItemIndex:=-1;
Edit6.Text:='';
Edit5.Text:='';
end;

procedure TForm4.Edit6Click(Sender: TObject);
begin
OpenPictureDialog1.Execute;
Edit6.Text:=OpenPictureDialog1.FileName;
end;

procedure TForm4.FormActivate(Sender: TObject);
var log:string;
    pas:string;
    md5: TIdHashMessageDigest5;
begin
md5:= TIdHashMessageDigest5.Create;
InputQuery('Логин', 'Ввведите логин', log);
InputQuery('Пароль','Ввведите пароль',pas);
if (md5.HashStringAsHex(log)<>'21232F297A57A5A743894A0E4A801FC3') or (md5.HashStringAsHex(pas)<>'21232F297A57A5A743894A0E4A801FC3') then  begin
Application.MessageBox('Кнопка добавить заблокированна', 'Доступ запрещён', MB_OK + MB_ICONSTOP);
Button1.Enabled:=False;
end;
md5.Free;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form3.Focused;
end;
end.

