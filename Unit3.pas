unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    FIO: TEdit;
    Label2: TLabel;
    Grop: TEdit;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses курсач, Unit4;


procedure TForm3.Button1Click(Sender: TObject);
begin
nameus:=FIO.Text;
namegr:=Grop.Text;
Form1.StartTest;
Form1.Show;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
form4.show;
Form1.Hide;
Form3.Hide;
end;

end.
