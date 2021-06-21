unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Spin, FPCanvas, FileCtrl;

type

  { TForm1 }

  TForm1 = class(TForm)
    CanvasBox: TPaintBox;
    CircleBtn: TBitBtn;
    BitBtn10: TBitBtn;
    LineColor: TColorButton;
    FillColor: TColorButton;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    SaveDialog1: TSaveDialog;
    ScrollBox2: TScrollBox;
    SquareBtn: TBitBtn;
    PentagonBtn: TBitBtn;
    HexagonBtn: TBitBtn;
    TriangleBtn: TBitBtn;
    RhombusBtn: TBitBtn;
    PencilBtn: TBitBtn;
    LineBtn: TBitBtn;
    EraserBtn: TBitBtn;
    dash_box: TComboBox;
    DrawBox: TGroupBox;
    ColorBox: TGroupBox;
    CoordinateX: TEdit;
    CoordinateY: TEdit;
    GroupBox1: TGroupBox;
    XLabel: TLabel;
    YLabel: TLabel;
    ScaleBox: TGroupBox;
    MoveBox: TGroupBox;
    LineBox: TGroupBox;
    DashLabel: TLabel;
    OpenButton: TSpeedButton;
    BucketBtn: TSpeedButton;
    EyedropBtn: TSpeedButton;
    LeftUpBtn: TSpeedButton;
    PlusBtn: TSpeedButton;
    MinusBtn: TSpeedButton;
    UpBtn: TSpeedButton;
    LeftBtn: TSpeedButton;
    RightUpBtn: TSpeedButton;
    RightBtn: TSpeedButton;
    LeftDownBtn: TSpeedButton;
    DownBtn: TSpeedButton;
    RightDownBtn: TSpeedButton;
    MoveSpin: TSpinEdit;
    WidthSpin: TSpinEdit;
    WidthLabel: TLabel;
    ObjekBox: TGroupBox;
    ScrollBox1: TScrollBox;
    ToolBox: TGroupBox;
    FileBox: TGroupBox;
    SaveButton: TSpeedButton;
    ClearButton: TSpeedButton;
    procedure CanvasBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CanvasBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure CanvasBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CanvasBoxPaint(Sender: TObject);
    procedure CircleBtnClick(Sender: TObject);
    procedure CanvasBoxClick(Sender: TObject);
    procedure dash_boxChange(Sender: TObject);
    procedure EraserBtnClick(Sender: TObject);
    procedure FillColorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LineColorClick(Sender: TObject);
    procedure LineColorColorChanged(Sender: TObject);
    procedure ObjekBoxClick(Sender: TObject);
    procedure FileBoxClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure ObjekClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure PencilBtnClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure WidthSpinChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  bitmap: TBitmap;

  CirclePoint : array[1..2] of TPoint;
  SquarePoint : array[1..5] of TPoint;
  PentagonPoint : array[1..6] of TPoint;
  HexagonPoint : array[1..7] of TPoint;
  Triangle : array[1..4] of TPoint;
  Rhombus : array[1..4] of TPoint;

  style_line: TFPPenStyle;
  draw: Boolean;
  line_width: Integer;
  line_color: Integer;
  fill_color: Integer;
  width_canvas, height_canvas: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FileBoxClick(Sender: TObject);
begin

end;

procedure TForm1.ObjekBoxClick(Sender: TObject);
begin

end;

procedure TForm1.CircleBtnClick(Sender: TObject);
begin

end;

procedure TForm1.CanvasBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  draw:= True;
  CanvasBox.Canvas.MoveTo(X, Y);
  bitmap.Canvas.MoveTo(X, Y);
end;

procedure TForm1.CanvasBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if draw=True then
  begin
        CanvasBox.Canvas.LineTo(X, Y);
        bitmap.Canvas.LineTo(X, Y);
        CoordinateX.Text:= IntToStr(X);
        CoordinateY.Text:= IntToStr(Y);
  end;
end;

procedure TForm1.CanvasBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  draw:=False;
end;

procedure TForm1.CanvasBoxPaint(Sender: TObject);
begin
  CanvasBox.Canvas.Draw(0,0,bitmap);
  bitmap.Canvas.Draw(0,0,bitmap);
end;

procedure TForm1.CanvasBoxClick(Sender: TObject);
begin

end;

procedure TForm1.dash_boxChange(Sender: TObject);
begin
  case dash_box.ItemIndex of
  0 : style_line:=psSolid;
  1 : style_line:=psDot;
  2 : style_line:=psDash;
  3 : style_line:=psDashDot;
  4 : style_line:=psDashDotDot;
  end;
  CanvasBox.Canvas.Pen.Style:= style_line;
end;

procedure TForm1.EraserBtnClick(Sender: TObject);
begin
  CanvasBox.Canvas.Pen.Width:= line_width;
  CanvasBox.Canvas.Pen.Color:= clWhite;
end;

procedure TForm1.FillColorClick(Sender: TObject);
begin
  fill_color:= FillColor.ButtonColor;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  width_canvas:= CanvasBox.Width;
  height_canvas:= CanvasBox.Height;

  bitmap := TBitmap.Create;
  bitmap.Width := CanvasBox.Width;
  bitmap.Height := CanvasBox.Height;
  bitmap.PixelFormat := pf24bit;

  bitmap.Canvas.Pen.Color:=clWhite;
  bitmap.Canvas.Brush.Color:=clWhite;
  bitmap.Canvas.FillRect(0,0,bitmap.Width,bitmap.Height);

  ClearButtonClick(Sender);
end;

procedure TForm1.LineColorClick(Sender: TObject);
begin

end;

procedure TForm1.LineColorColorChanged(Sender: TObject);
begin
  line_color:= LineColor.ButtonColor;
  CanvasBox.Canvas.Pen.Color:= line_color;
end;

procedure TForm1.ObjekClick(Sender: TObject);
begin

end;

procedure TForm1.OpenButtonClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  if (OpenDialog1.Files.Count > 0) then begin
        if (FileExists(OpenDialog1.FileName)) then begin
           bitmap.LoadFromFile(OpenDialog1.FileName);
           CanvasBoxPaint(Sender);
        end else begin
            ShowMessage('File is not found. You will have to open an existing file.');
        end;
  end;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin

  CanvasBox.Canvas.Pen.Color:=clWhite;
  CanvasBox.Canvas.Brush.Color:=clWhite;
  CanvasBox.Canvas.FillRect(0,0,width_canvas,height_canvas);

  line_color:= LineColor.ButtonColor;
  line_width:= WidthSpin.Value;

  CanvasBox.Canvas.Pen.Color := line_color;
  CanvasBox.Canvas.Pen.Width := line_width;

  //CanvasBoxPaint(Sender);
end;

procedure TForm1.PencilBtnClick(Sender: TObject);
begin
  CanvasBox.Canvas.Pen.Width:= line_width;
  CanvasBox.Canvas.Pen.Color:= line_color;
  CanvasBox.Canvas.Pen.Style:= style_line;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
     if FileExists(SaveDialog1.FileName) then
     begin
        raise Exception.Create('File already exists. Cannot overwrite.');
     end else
     begin
          if RightStr(SaveDialog1.FileName, 4) <> '.png' then
          begin
             SaveDialog1.FileName:=SaveDialog1.FileName+'.png';
          end;
          bitmap.SaveToFile(SaveDialog1.FileName);
     end;
  end;
end;

procedure TForm1.WidthSpinChange(Sender: TObject);
begin
  line_width:= WidthSpin.Value;
  CanvasBox.Canvas.Pen.Width:= line_width;
end;

end.

