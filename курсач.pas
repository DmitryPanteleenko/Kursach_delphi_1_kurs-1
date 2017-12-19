unit курсач;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit3, Winapi.MMSystem,
  Vcl.Imaging.pngimage,System.Math, Vcl.Menus;

type
    vopros = record
        vopr:string;
        otv1:string;
        otv2:string;
        otv3:string;
        otv4:string;
        protv:Integer;
        img11:string;
        otvec:Boolean;
    end;
    mas=array[1..50] of vopros;

    TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    Label4: TLabel;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GenerateNewQ; // Прототип процедуры GenerateNewQ()
    procedure GenerateResult;
    procedure Timer1Timer(Sender: TObject);
    procedure StartTest;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    function FormHelp(Command: Word; Data: NativeInt;
      var CallHelp: Boolean): Boolean;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);// Прототип процедуры GenerateResult()
  end;


const // Объявление глобальных констант
 Q = 'Вопрос ';
 O_k = 'Верно';
 _of = ' из ';
 win1 = 'Ваша оценка';
 win2 = 'Поздравляем!';
 lost2 = 'Неверно';
 lost1 = 'Вы не прошли тест! Вы не умнее пятиклассника!';
var // Объявление глобальных переменных
  Form1: TForm1;
  N    : Integer;
  num  : Integer = 0;
  kolvo:Integer = 1;
  ri   : Integer;
  prav : Integer;
  time1: Integer;
  ostat: TDateTime;
  ostat1:TDateTime;
  vrem  :TDateTime;
  nameus:string;
  namegr:string;
  img :string;
  s:string;
  voprosy:mas;
  i:Integer;

implementation
{$R *.dfm}

uses Unit4;

procedure TForm1.GenerateNewQ;
label m1;
begin
    RadioGroup1.ItemIndex:=-1;
     inc(num);
  label1.Caption:= Q+inttostr(num)+_of+inttostr(N);
  m1:
  i:=RandomRange(1,17);
  if voprosy[i].otvec = True then
  goto m1;
  voprosy[i].otvec:=True;
  label2.Caption:=voprosy[i].vopr;
  RadioGroup1.Items.Strings[0]:=voprosy[i].otv1;
  RadioGroup1.Items.Strings[1]:=voprosy[i].otv2;
  RadioGroup1.Items.Strings[2]:=voprosy[i].otv3;
  RadioGroup1.Items.Strings[3]:= voprosy[i].otv4;
  RadioGroup1.Buttons[ri].Checked:= false;
  Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+voprosy[i].img11);
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
ri:=voprosy[i].protv;
If (RadioGroup1.Buttons[ri].Checked) and (num<N) then // Условие: Если у компонента RadioGroup1 ri-ый RadioButton выбран и переменная
                                        // num больше переменной N, то
 begin
 Label3.Font.Color:=clGreen;
  label3.Caption:= Q+inttostr(num)+' - '+O_k; // в labal выводим знач. перем. Q и знач. переменной num
  inc(prav);
  PlaySound(PChar(ExtractFilePath(Application.ExeName)+'PR.wav'), 0, SND_FILENAME or SND_ASYNC);
  GenerateNewQ; // и вызываем функцию GenerateNewQ
 end
                // Дальше уже сами поймете
  else
   if (num=N) and (RadioGroup1.Buttons[ri].Checked) then
   begin
      inc(prav);
      PlaySound(PChar(ExtractFilePath(Application.ExeName)+'PR.wav'), 0, SND_FILENAME or SND_ASYNC);
      GenerateResult;
   end

     else
      if (not RadioGroup1.Buttons[ri].Checked) and (num<N) then
      begin
      PlaySound(PChar(ExtractFilePath(Application.ExeName)+'NPR.wav'), 0, SND_FILENAME or SND_ASYNC);
       Label3.Font.Color:=clRed;
      label3.Caption:= Q+inttostr(num)+' - '+lost2; // в labal выводим знач. перем. Q и знач. переменной num
      GenerateNewQ;
      end
      else
      GenerateResult;
      Button1.Enabled:=False;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
closefile(input);
form1.Close;
Form3.Close;
Application.Terminate;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Application.CreateForm(TForm3,Form3);
Form3.Show;
end;

function TForm1.FormHelp(Command: Word; Data: NativeInt;
  var CallHelp: Boolean): Boolean;
begin
HtmlHelp(handle,ExtractFilePath(Application.ExeName)+ 'help.chm',HH_DISPLAY_TOPIC,0);
end;

procedure TForm1.StartTest;
var k:Integer;
begin
Form3.Close;
k:=1;
Timer1.Interval:=1000;
Timer1.Enabled:=True;
ostat:=StrToTime('00:10:00');
vrem:=ostat;
ostat1:=StrToTime('00:00:01');
 assignfile(input,ExtractFilePath(Application.ExeName)+'test.txt'); // Инациализируется переменная input для дальнейшей работы с файлом test.txt
 Reset(Input);
 readln(Input,N); // Считываем число в переменную
while not Eof(Input) do
 begin
  readln(Input,voprosy[k].vopr);
  Readln(input,voprosy[k].otv1);
  Readln(input,voprosy[k].otv2);
  Readln(input,voprosy[k].otv3);
  Readln(input,voprosy[k].otv4);
  Readln(input,voprosy[k].protv);
  Readln(input,voprosy[k].img11);
  Readln(Input);
   inc(k);
   end;

 Label1.Caption:=IntToStr(N);
 if (N>0) then // Условие: если число из переменно N больше нуля, то
   GenerateNewQ // вызывается функция GenerateNewQ
  else // иначе
   begin
    closefile(input); // закрываем файл input(тоесть test.txt)
    form1.Close // изыкрываем форму
   end;
end;

procedure TForm1.GenerateResult;
var
rz:TextFile;
prav1:Real;
begin
prav1:=prav mod N;
if (prav1>=6) then
Label3.Font.Color:=clGreen
else
Label3.Font.Color:=clred;
 label1.Caption:= win2; // В label выводим знач. перменной win2
   label2.Caption:= win1+' '+floattostr(prav1);
   label3.Caption:= O_k+' ' +' ' + IntToStr(prav) +' ' + _of +' ' + IntToStr(N);
   button1.Visible:= false; // а тут button невидемый
   Image2.Visible:=False;
   radiogroup1.Visible:= false; // и radiogroup1
   label4.Visible:=false;
Timer1.Enabled:=False;
assignfile(rz,ExtractFilePath(Application.ExeName)+'rez.txt');
 Append(rz);
 writeln(rz,'Пользователь',' ',nameus,' ','группа',' ',namegr,' прошёл тест правильно ответив на ',prav,' вопросов');
 CloseFile(rz);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
HtmlHelp(handle,ExtractFilePath(ParamStr(0))+ 'help.chm',HH_DISPLAY_TOPIC,0);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
Button1.Enabled:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Inc(time1);
   vrem:=vrem-ostat1;
   label4.Caption:=FormatDateTime('n:ss',vrem);
if (time1>=100) then
begin
label4.Caption:='время вышло';
Timer1.Enabled:=False;
GenerateResult;
end;
end;
end.

