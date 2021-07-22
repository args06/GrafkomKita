unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Spin, FPCanvas, FileCtrl, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    SpinSkew: TSpinEdit;
    VerticalSkew: TBitBtn;
    HorizontalSkew: TBitBtn;
    SkewBox: TGroupBox;
    HorizontalFlip: TBitBtn;
    VerticalFlip: TBitBtn;
    RotateRight: TBitBtn;
    RotateLeft: TBitBtn;
    MinusBtn: TBitBtn;
    PlusBtn: TBitBtn;
    EyedropBtn: TBitBtn;
    BucketBtn: TBitBtn;
    CanvasBox: TPaintBox;
    CircleBtn: TBitBtn;
    BitBtn10: TBitBtn;
    FillLabel: TLabel;
    RotateBox: TGroupBox;
    LineLabel: TLabel;
    LineColor: TColorButton;
    FillColor: TColorButton;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    SaveDialog1: TSaveDialog;
    ScrollBox2: TScrollBox;
    RotateSpin: TSpinEdit;
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
    LeftUpBtn: TSpeedButton;
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
    procedure DownBtnClick(Sender: TObject);
    procedure EraserBtnClick(Sender: TObject);
    procedure FillColorColorChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HorizontalSkewClick(Sender: TObject);
    procedure MinusBtnClick(Sender: TObject);
    procedure PlusBtnClick(Sender: TObject);
    procedure RotateSpinChange(Sender: TObject);
    procedure SkewBoxClick(Sender: TObject);
    procedure HexagonBtnClick(Sender: TObject);
    procedure LeftBtnClick(Sender: TObject);
    procedure LeftDownBtnClick(Sender: TObject);
    procedure LeftUpBtnClick(Sender: TObject);
    procedure LineBtnClick(Sender: TObject);
    procedure LineColorClick(Sender: TObject);
    procedure LineColorColorChanged(Sender: TObject);
    procedure MoveSpinChange(Sender: TObject);
    procedure MoveSpinClick(Sender: TObject);
    procedure ObjekBoxClick(Sender: TObject);
    procedure FileBoxClick(Sender: TObject);
    procedure LineLabelClick(Sender: TObject);
    procedure ObjekClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure PencilBtnClick(Sender: TObject);
    procedure PentagonBtnClick(Sender: TObject);
    procedure RhombusBtnClick(Sender: TObject);
    procedure RightBtnClick(Sender: TObject);
    procedure RightDownBtnClick(Sender: TObject);
    procedure RightUpBtnClick(Sender: TObject);
    procedure RotateLeftClick(Sender: TObject);
    procedure RotateRightClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure SpinSkewChange(Sender: TObject);
    procedure SquareBtnClick(Sender: TObject);
    procedure TriangleBtnClick(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
    procedure VerticalSkewClick(Sender: TObject);
    procedure WidthSpinChange(Sender: TObject);
    procedure WidthSpinClick(Sender: TObject);
    procedure MidPoint;
    procedure DrawObject(Sender: TObject);
    procedure RotatingObject(Sender: TObject);
    procedure SkewingObject(Sender: TObject);
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
  TrianglePoint : array[1..4] of TPoint;
  RhombusPoint : array[1..5] of TPoint;
  TOB : TPoint;

  style_line: TFPPenStyle;
  draw: Boolean;
  line_width: Integer;
  line_color: Integer;
  fill_color: Integer;
  preX, preY: Integer;
  move_value: Integer;
  skew_value: Integer;
  rotate_value: Double;
  r: Integer;

  selected_object: String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.LineLabelClick(Sender: TObject);
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
  selected_object:= 'Circle';
end;

procedure TForm1.CanvasBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  draw:= True;
  preX:= X;
  preY:= Y;
  //CanvasBox.Canvas.MoveTo(X, Y);
end;

procedure TForm1.CanvasBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if draw=True then
  begin
     if PencilBtn.Active = True then
     begin
        CanvasBox.Canvas.Line(preX, preY, X, Y);
        bitmap.Canvas.Line(preX, preY, X, Y);
        preX:= X;
        preY:= Y;
     end
     else if EraserBtn.Active = True then
     begin
        CanvasBox.Canvas.Line(preX, preY, X, Y);
        bitmap.Canvas.Line(preX, preY, X, Y);
        CanvasBox.Canvas.Pen.Color:=clWhite;
        bitmap.Canvas.Pen.Color:=clWhite;
        bitmap.Canvas.Pen.Width:= line_width;
        preX:= X;
        preY:= Y;
     end
     else if LineBtn.Active = True then
     begin
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Line(preX, preY, X, Y);
     end
     else if SquareBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        dash_box.Enabled:=True;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Rectangle(preX, preY, X, Y);
        SquarePoint[1].x:=preX;
        SquarePoint[1].y:=Y;
        SquarePoint[2].x:=X;
        SquarePoint[2].y:=Y;
        SquarePoint[3].x:=X;
        SquarePoint[3].y:=preY;
        SquarePoint[4].x:=preX;
        SquarePoint[4].y:=preY;
        SquarePoint[5].x:=SquarePoint[1].x;
        SquarePoint[5].y:=SquarePoint[1].y;
     end
     else if CircleBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Ellipse(preX, preY, X, Y);
        CirclePoint[1].x:=preX;
        CirclePoint[1].y:=preY;
        CirclePoint[2].x:=X;
        CirclePoint[2].y:=Y;
     end
     else if PentagonBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Line(preX, preY+((Y-preY)div 2), preX+((X-preX)div 2), preY);
        CanvasBox.Canvas.Line(preX+((X-preX)div 2), preY, X, preY+((Y-preY)div 2));
        CanvasBox.Canvas.Line(X, preY+((Y-preY)div 2), preX+((X-preX)*3 div 4), Y);
        CanvasBox.Canvas.Line(preX+((X-preX)*3 div 4), Y, preX+((X-preX) div 4), Y);
        CanvasBox.Canvas.Line(preX+((X-preX) div 4), Y, preX, preY+((Y-preY)div 2));
        PentagonPoint[1].x:=preX;
        PentagonPoint[1].y:=preY+((Y-preY)div 2);
        PentagonPoint[2].x:=preX+((X-preX)div 2);
        PentagonPoint[2].y:=preY;
        PentagonPoint[3].x:=X;
        PentagonPoint[3].y:=preY+((Y-preY)div 2);
        PentagonPoint[4].x:=preX+((X-preX)*3 div 4);
        PentagonPoint[4].y:=Y;
        PentagonPoint[5].x:=preX+((X-preX) div 4);
        PentagonPoint[5].y:=Y;
        PentagonPoint[6].x:=PentagonPoint[1].x;
        PentagonPoint[6].y:=PentagonPoint[1].y;
     end
     else if HexagonBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Line(preX, preY+((Y-preY) div 2),preX+((X-preX) div 4),preY);
        CanvasBox.Canvas.Line(preX+((X-preX) div 4),preY, preX+((X-preX)*3 div 4),preY);
        CanvasBox.Canvas.Line(preX+((X-preX)*3 div 4), preY, X,preY+((Y-PreY) div 2));
        CanvasBox.Canvas.Line(X, preY+((Y-preY) div 2), preX+((X-preX)*3 div 4), Y);
        CanvasBox.Canvas.Line(preX+((X-preX)*3 div 4), Y,preX+((X-preX) div 4), Y);
        CanvasBox.Canvas.Line(preX+((X-preX) div 4), Y, preX,preY+((Y-preY) div 2) );
        HexagonPoint[1].x:=preX;
        HexagonPoint[1].y:=preY+((Y-preY) div 2);
        HexagonPoint[2].x:=preX+((X-preX) div 4);
        HexagonPoint[2].y:=preY;
        HexagonPoint[3].x:=preX+((X-preX)*3 div 4);
        HexagonPoint[3].y:=preY;
        HexagonPoint[4].x:=X;
        HexagonPoint[4].y:=preY+((Y-preY) div 2);
        HexagonPoint[5].x:=preX+((X-preX)*3 div 4);
        HexagonPoint[5].y:=Y;
        HexagonPoint[6].x:=preX+((X-preX) div 4);
        HexagonPoint[6].y:=Y;
        HexagonPoint[7].x:=HexagonPoint[1].x;
        HexagonPoint[7].y:=HexagonPoint[1].y;
     end
     else if TriangleBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Line(preX,Y,preX+((X-preX) div 2), preY);
        CanvasBox.Canvas.Line(preX+((X-preX) div 2),preY,X,Y);
        CanvasBox.Canvas.Line(X,Y,preX,Y);
        TrianglePoint[1].x:=preX;
        TrianglePoint[1].y:=Y;
        TrianglePoint[2].x:=preX+((X-preX) div 2);
        TrianglePoint[2].y:=preY;
        TrianglePoint[3].x:=X;
        TrianglePoint[3].y:=Y;
        TrianglePoint[4].x:=TrianglePoint[1].x;
        TrianglePoint[4].y:=TrianglePoint[1].y;
     end
     else if RhombusBtn.Active = True then
     begin
        CanvasBox.Cursor:=crCross;
        CanvasBoxPaint(Sender);
        CanvasBox.Canvas.Line(preX, preY+((Y-preY) div 2),preX+((X-preX) div 2),preY);
        CanvasBox.Canvas.Line(preX+((X-preX) div 2), preY, X,preY+((Y-preY) div 2));
        CanvasBox.Canvas.Line(X, preY+((Y-preY) div 2), preX+((X-preX) div 2), Y);
        CanvasBox.Canvas.Line(preX+((X-preX) div 2), Y, preX,preY+((Y-preY) div 2) );
        RhombusPoint[1].x:=preX;
        RhombusPoint[1].y:=preY+((Y-preY) div 2);
        RhombusPoint[2].x:=preX+((X-preX) div 2);
        RhombusPoint[2].y:=preY;
        RhombusPoint[3].x:=X;
        RhombusPoint[3].y:=preY+((Y-preY) div 2);
        RhombusPoint[4].x:=preX+((X-preX) div 2);
        RhombusPoint[4].y:=Y;
        RhombusPoint[5].x:=RhombusPoint[1].x;
        RhombusPoint[5].y:=RhombusPoint[1].y;
     end;

     CoordinateX.Text:= IntToStr(X);
     CoordinateY.Text:= IntToStr(Y);
  end;
end;

procedure TForm1.CanvasBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TempColor : TColor;
begin
  if draw=True then
  begin
     CanvasBox.Cursor:=crHandPoint;
     CanvasBox.Canvas.Pen.Width:= line_width;
     CanvasBox.Canvas.Pen.Color:= line_color;
     CanvasBox.Canvas.Pen.Style:= style_line;
     bitmap.Canvas.Pen.Width:= line_width;
     bitmap.Canvas.Pen.Color:= line_color;
     bitmap.Canvas.Pen.Style:= style_line;

     if LineBtn.Active = True then
     begin
        bitmap.Canvas.Line(preX, preY, X, Y);
     end
     else if SquareBtn.Active = True then
     begin
        bitmap.Canvas.Rectangle(preX, preY, X, Y);
        dash_box.Enabled:=True;
     end
     else if CircleBtn.Active = True then
     begin
        bitmap.Canvas.Ellipse(preX, preY, X, Y);
     end
     else if PentagonBtn.Active = True then
     begin
        bitmap.Canvas.Line(preX, preY+((Y-preY)div 2), preX+((X-preX)div 2), preY);
        bitmap.Canvas.Line(preX+((X-preX)div 2), preY, X, preY+((Y-preY)div 2));
        bitmap.Canvas.Line(X, preY+((Y-preY)div 2), preX+((X-preX)*3 div 4), Y);
        bitmap.Canvas.Line(preX+((X-preX)*3 div 4), Y, preX+((X-preX) div 4), Y);
        bitmap.Canvas.Line(preX+((X-preX) div 4), Y, preX, preY+((Y-preY)div 2));
     end
     else if HexagonBtn.Active = True then
     begin
        bitmap.Canvas.Line(preX, preY+((Y-preY) div 2),preX+((X-preX) div 4),preY);
        bitmap.Canvas.Line(preX+((X-preX) div 4),preY, preX+((X-preX)*3 div 4),preY);
        bitmap.Canvas.Line(preX+((X-preX)*3 div 4), preY, X,preY+((Y-PreY) div 2));
        bitmap.Canvas.Line(X, preY+((Y-preY) div 2), preX+((X-preX)*3 div 4), Y);
        bitmap.Canvas.Line(preX+((X-preX)*3 div 4), Y,preX+((X-preX) div 4), Y);
        bitmap.Canvas.Line(preX+((X-preX) div 4), Y, preX,preY+((Y-preY) div 2) );
     end
     else if TriangleBtn.Active = True then
     begin
        bitmap.Canvas.Line(preX,Y,preX+((X-preX) div 2), preY);
        bitmap.Canvas.Line(preX+((X-preX) div 2),preY,X,Y);
        bitmap.Canvas.Line(preX,Y,X,Y);
     end
     else if RhombusBtn.Active = True then
     begin
        bitmap.Canvas.Line(preX, preY+((Y-preY) div 2),preX+((X-preX) div 2),preY);
        bitmap.Canvas.Line(preX+((X-preX) div 2), preY, X,preY+((Y-preY) div 2));
        bitmap.Canvas.Line(X, preY+((Y-preY) div 2), preX+((X-preX) div 2), Y);
        bitmap.Canvas.Line(preX+((X-preX) div 2), Y, preX,preY+((Y-preY) div 2) );
     end
     else if BucketBtn.Active = True then
     begin
        TempColor := bitmap.Canvas.Pixels[X, Y];
        bitmap.Canvas.Brush.Style := bsSolid;
        bitmap.Canvas.Brush.Color :=FillColor.ButtonColor;
        bitmap.Canvas.FloodFill(X, Y, TempColor,fsSurface);
        bitmap.Canvas.Brush.Style := bsClear;
        CanvasBoxPaint(Sender);
     end
     else if EyedropBtn.Active = True then
     begin
        FillColor.ButtonColor:=CanvasBox.Canvas.Pixels[X,Y];
        CanvasBoxPaint(Sender);
     end;

  end;
  draw:=False;
end;

procedure TForm1.CanvasBoxPaint(Sender: TObject);
begin
  if CanvasBox.Width<>bitmap.Width then begin
    CanvasBox.Width:=bitmap.Width;
    Exit;
  end;
  if CanvasBox.Height<>bitmap.Height then begin
   CanvasBox.Height:=bitmap.Height;
    Exit;
  end;
  CanvasBox.Canvas.Draw(0,0,bitmap);
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

procedure TForm1.DownBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y+move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y+move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y+move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y+move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y+move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y+move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.EraserBtnClick(Sender: TObject);
begin
  CanvasBox.Canvas.Pen.Width:= line_width;
  CanvasBox.Canvas.Pen.Color:= clWhite;
end;


procedure TForm1.FillColorColorChanged(Sender: TObject);
begin
  fill_color:= FillColor.ButtonColor;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClearButtonClick(Sender);
  CanvasBoxPaint(Sender);
end;

procedure TForm1.HorizontalSkewClick(Sender: TObject);
begin
  SkewingObject(Sender);
end;

procedure TForm1.MinusBtnClick(Sender: TObject);
var
  i : integer;
begin
  MidPoint;

  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].X:=SquarePoint[i].X-TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y-TOB.y;

          SquarePoint[i].X:=round(SquarePoint[i].X * 0.5);
          SquarePoint[i].Y:=round(SquarePoint[i].Y * 0.5);

          SquarePoint[i].X:=SquarePoint[i].X+TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].X:=PentagonPoint[i].X-TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y-TOB.y;

          PentagonPoint[i].X:=round(PentagonPoint[i].X * 0.5);
          PentagonPoint[i].Y:=round(PentagonPoint[i].Y * 0.5);

          PentagonPoint[i].X:=PentagonPoint[i].X+TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].X:=HexagonPoint[i].X-TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y-TOB.y;

          HexagonPoint[i].X:=round(HexagonPoint[i].X * 0.5);
          HexagonPoint[i].Y:=round(HexagonPoint[i].Y * 0.5);

          HexagonPoint[i].X:=HexagonPoint[i].X+TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].X:=TrianglePoint[i].X-TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y-TOB.y;

          TrianglePoint[i].X:=round(TrianglePoint[i].X * 0.5);
          TrianglePoint[i].Y:=round(TrianglePoint[i].Y * 0.5);

          TrianglePoint[i].X:=TrianglePoint[i].X+TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].X:=RhombusPoint[i].X-TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y-TOB.y;

          RhombusPoint[i].X:=round(RhombusPoint[i].X * 0.5);
          RhombusPoint[i].Y:=round(RhombusPoint[i].Y * 0.5);

          RhombusPoint[i].X:=RhombusPoint[i].X+TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].X:=CirclePoint[i].X-TOB.x;
          CirclePoint[i].Y:=CirclePoint[i].Y-TOB.y;

          CirclePoint[i].X:=round(CirclePoint[i].X * 0.5);
          CirclePoint[i].Y:=round(CirclePoint[i].Y * 0.5);

          CirclePoint[i].X:=CirclePoint[i].X+TOB.x;
          CirclePoint[i].Y:=CirclePoint[i].Y+TOB.y;
     end;
  end;
  DrawObject(Sender);
end;

procedure TForm1.PlusBtnClick(Sender: TObject);
var
  i : integer;
begin
  MidPoint;

  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].X:=SquarePoint[i].X-TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y-TOB.y;

          SquarePoint[i].X:=round(SquarePoint[i].X * 1.5);
          SquarePoint[i].Y:=round(SquarePoint[i].Y * 1.5);

          SquarePoint[i].X:=SquarePoint[i].X+TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].X:=PentagonPoint[i].X-TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y-TOB.y;

          PentagonPoint[i].X:=round(PentagonPoint[i].X * 1.5);
          PentagonPoint[i].Y:=round(PentagonPoint[i].Y * 1.5);

          PentagonPoint[i].X:=PentagonPoint[i].X+TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].X:=HexagonPoint[i].X-TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y-TOB.y;

          HexagonPoint[i].X:=round(HexagonPoint[i].X * 1.5);
          HexagonPoint[i].Y:=round(HexagonPoint[i].Y * 1.5);

          HexagonPoint[i].X:=HexagonPoint[i].X+TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].X:=TrianglePoint[i].X-TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y-TOB.y;

          TrianglePoint[i].X:=round(TrianglePoint[i].X * 1.5);
          TrianglePoint[i].Y:=round(TrianglePoint[i].Y * 1.5);

          TrianglePoint[i].X:=TrianglePoint[i].X+TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].X:=RhombusPoint[i].X-TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y-TOB.y;

          RhombusPoint[i].X:=round(RhombusPoint[i].X * 1.5);
          RhombusPoint[i].Y:=round(RhombusPoint[i].Y * 1.5);

          RhombusPoint[i].X:=RhombusPoint[i].X+TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].X:=CirclePoint[i].X-TOB.x;
          CirclePoint[i].Y:=CirclePoint[i].Y-TOB.y;

          CirclePoint[i].X:=round(CirclePoint[i].X * 1.5);
          CirclePoint[i].Y:=round(CirclePoint[i].Y * 1.5);

          CirclePoint[i].X:=CirclePoint[i].X+TOB.x;
          CirclePoint[i].Y:=CirclePoint[i].Y+TOB.y;
     end;
  end;
  DrawObject(Sender);
end;

procedure TForm1.RotateSpinChange(Sender: TObject);
begin
  rotate_value:= RotateSpin.Value;
end;

procedure TForm1.SkewBoxClick(Sender: TObject);
begin

end;

procedure TForm1.HexagonBtnClick(Sender: TObject);
begin
  selected_object:= 'Hexagon';
end;

procedure TForm1.LeftBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].X:=SquarePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].X:=CirclePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].X:=PentagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].X:=HexagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].X:=TrianglePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].X:=RhombusPoint[i].X-move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.LeftDownBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y+move_value;
          SquarePoint[i].X:=SquarePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y+move_value;
          CirclePoint[i].X:=CirclePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y+move_value;
          PentagonPoint[i].X:=PentagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y+move_value;
          HexagonPoint[i].X:=HexagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y+move_value;
          TrianglePoint[i].X:=TrianglePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y+move_value;
          RhombusPoint[i].X:=RhombusPoint[i].X-move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.LeftUpBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y-move_value;
          SquarePoint[i].X:=SquarePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y-move_value;
          CirclePoint[i].X:=CirclePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y-move_value;
          PentagonPoint[i].X:=PentagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y-move_value;
          HexagonPoint[i].X:=HexagonPoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y-move_value;
          TrianglePoint[i].X:=TrianglePoint[i].X-move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y-move_value;
          RhombusPoint[i].X:=RhombusPoint[i].X-move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.LineBtnClick(Sender: TObject);
begin
  CanvasBox.Canvas.Pen.Width:= line_width;
  CanvasBox.Canvas.Pen.Color:= line_color;
  CanvasBox.Canvas.Pen.Style:= style_line;
  bitmap.Canvas.Pen.Width:= line_width;
  bitmap.Canvas.Pen.Color:= line_color;
  bitmap.Canvas.Pen.Style:= style_line;
end;

procedure TForm1.LineColorClick(Sender: TObject);
begin

end;

procedure TForm1.LineColorColorChanged(Sender: TObject);
begin
  line_color:= LineColor.ButtonColor;
  CanvasBox.Canvas.Pen.Color:= line_color;
end;

procedure TForm1.MoveSpinChange(Sender: TObject);
begin
  move_value:= MoveSpin.Value;
end;

procedure TForm1.MoveSpinClick(Sender: TObject);
begin

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

  if bitmap <> nil then
      bitmap.Destroy;

  bitmap := TBitmap.Create;

  bitmap.SetSize(CanvasBox.Width, CanvasBox.Height);
  bitmap.Canvas.FillRect(0,0,bitmap.Width,bitmap.Height);

  bitmap.Canvas.Pen.Color:=clWhite;
  bitmap.Canvas.Brush.Color:=clWhite;

  line_color:= LineColor.ButtonColor;
  line_width:= WidthSpin.Value;
  rotate_value:= RotateSpin.Value;
  move_value:= MoveSpin.Value;

  CanvasBoxPaint(Sender);
end;

procedure TForm1.PencilBtnClick(Sender: TObject);
begin
  CanvasBox.Canvas.Pen.Width:= line_width;
  CanvasBox.Canvas.Pen.Color:= line_color;
  CanvasBox.Canvas.Pen.Style:= style_line;
  bitmap.Canvas.Pen.Width:= line_width;
  bitmap.Canvas.Pen.Color:= line_color;
  bitmap.Canvas.Pen.Style:= style_line;
end;

procedure TForm1.PentagonBtnClick(Sender: TObject);
begin
  selected_object:= 'Pentagon';
end;

procedure TForm1.RhombusBtnClick(Sender: TObject);
begin
  selected_object:= 'Rhombus';
end;

procedure TForm1.RightBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].X:=SquarePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].X:=CirclePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].X:=PentagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].X:=HexagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].X:=TrianglePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].X:=RhombusPoint[i].X+move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.RightDownBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y+move_value;
          SquarePoint[i].X:=SquarePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y+move_value;
          CirclePoint[i].X:=CirclePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y+move_value;
          PentagonPoint[i].X:=PentagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y+move_value;
          HexagonPoint[i].X:=HexagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y+move_value;
          TrianglePoint[i].X:=TrianglePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y+move_value;
          RhombusPoint[i].X:=RhombusPoint[i].X+move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.RightUpBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y-move_value;
          SquarePoint[i].X:=SquarePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y-move_value;
          CirclePoint[i].X:=CirclePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y-move_value;
          PentagonPoint[i].X:=PentagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y-move_value;
          HexagonPoint[i].X:=HexagonPoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y-move_value;
          TrianglePoint[i].X:=TrianglePoint[i].X+move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y-move_value;
          RhombusPoint[i].X:=RhombusPoint[i].X+move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.RotatingObject(Sender: TObject);
var
  i,tx,ty : integer;
begin
  MidPoint;

  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].X:=SquarePoint[i].X-TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y-TOB.y;

          tx:=SquarePoint[i].X;
          ty:=SquarePoint[i].Y;

          SquarePoint[i].X:=round(tx*cos(rotate_value)-ty*sin(rotate_value));
          SquarePoint[i].Y:=round(tx*sin(rotate_value)+ty*cos(rotate_value));

          SquarePoint[i].X:=SquarePoint[i].X+TOB.x;
          SquarePoint[i].Y:=SquarePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].X:=PentagonPoint[i].X-TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y-TOB.y;

          tx:=PentagonPoint[i].X;
          ty:=PentagonPoint[i].Y;

          PentagonPoint[i].X:=round(tx*cos(rotate_value)-ty*sin(rotate_value));
          PentagonPoint[i].Y:=round(tx*sin(rotate_value)+ty*cos(rotate_value));

          PentagonPoint[i].X:=PentagonPoint[i].X+TOB.x;
          PentagonPoint[i].Y:=PentagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].X:=HexagonPoint[i].X-TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y-TOB.y;

          tx:=HexagonPoint[i].X;
          ty:=HexagonPoint[i].Y;

          HexagonPoint[i].X:=round(tx*cos(rotate_value)-ty*sin(rotate_value));
          HexagonPoint[i].Y:=round(tx*sin(rotate_value)+ty*cos(rotate_value));

          HexagonPoint[i].X:=HexagonPoint[i].X+TOB.x;
          HexagonPoint[i].Y:=HexagonPoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].X:=TrianglePoint[i].X-TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y-TOB.y;

          tx:=TrianglePoint[i].X;
          ty:=TrianglePoint[i].Y;

          TrianglePoint[i].X:=round(tx*cos(rotate_value)-ty*sin(rotate_value));
          TrianglePoint[i].Y:=round(tx*sin(rotate_value)+ty*cos(rotate_value));

          TrianglePoint[i].X:=TrianglePoint[i].X+TOB.x;
          TrianglePoint[i].Y:=TrianglePoint[i].Y+TOB.y;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].X:=RhombusPoint[i].X-TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y-TOB.y;

          tx:=RhombusPoint[i].X;
          ty:=RhombusPoint[i].Y;

          RhombusPoint[i].X:=round(tx*cos(rotate_value)-ty*sin(rotate_value));
          RhombusPoint[i].Y:=round(tx*sin(rotate_value)+ty*cos(rotate_value));

          RhombusPoint[i].X:=RhombusPoint[i].X+TOB.x;
          RhombusPoint[i].Y:=RhombusPoint[i].Y+TOB.y;
     end;
  end;

  DrawObject(Sender);
end;

procedure TForm1.RotateLeftClick(Sender: TObject);

begin
  rotate_value:= 0 - ((RotateSpin.Value Mod 360) / (180*PI));
  RotatingObject(Sender);
end;

procedure TForm1.RotateRightClick(Sender: TObject);
begin
  rotate_value:= (RotateSpin.Value Mod 360) / (180*PI);
  RotatingObject(Sender);
end;

procedure TForm1.SkewingObject(Sender: TObject);
var
  i,tx,ty : integer;
begin

  if selected_object = 'Square' then
  begin
     if HorizontalSkew.Active = True then
     begin
        SquarePoint[1].X:=SquarePoint[1].X+skew_value;
        SquarePoint[2].X:=SquarePoint[2].X+skew_value;
        SquarePoint[3].X:=SquarePoint[3].X-skew_value;
        SquarePoint[4].X:=SquarePoint[4].X-skew_value;
        SquarePoint[5].X:=SquarePoint[1].X;
     end
     else if VerticalSkew.Active = True then
     begin
        SquarePoint[1].Y:=SquarePoint[1].Y+skew_value;
        SquarePoint[2].Y:=SquarePoint[2].Y-skew_value;
        SquarePoint[3].Y:=SquarePoint[3].Y-skew_value;
        SquarePoint[4].Y:=SquarePoint[4].Y+skew_value;
        SquarePoint[5].Y:=SquarePoint[1].Y;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     if HorizontalSkew.Active = True then
     begin
        PentagonPoint[1].X:=PentagonPoint[1].X+skew_value;
        PentagonPoint[2].X:=PentagonPoint[2].X+skew_value;
        PentagonPoint[3].X:=PentagonPoint[3].X+skew_value;
        PentagonPoint[4].X:=PentagonPoint[4].X-skew_value;
        PentagonPoint[5].X:=PentagonPoint[5].X-skew_value;
        PentagonPoint[6].X:=PentagonPoint[1].X;
     end
     else if VerticalSkew.Active = True then
     begin
        PentagonPoint[1].Y:=PentagonPoint[1].Y+skew_value;
        PentagonPoint[2].Y:=PentagonPoint[2].Y;
        PentagonPoint[3].Y:=PentagonPoint[3].Y-skew_value;
        PentagonPoint[4].Y:=PentagonPoint[4].Y-skew_value;
        PentagonPoint[5].Y:=PentagonPoint[5].Y+skew_value;
        PentagonPoint[6].Y:=PentagonPoint[1].Y;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     if HorizontalSkew.Active = True then
     begin
        HexagonPoint[1].X:=HexagonPoint[1].X;
        HexagonPoint[2].X:=HexagonPoint[2].X+skew_value;
        HexagonPoint[3].X:=HexagonPoint[3].X+skew_value;
        HexagonPoint[4].X:=HexagonPoint[4].X;
        HexagonPoint[5].X:=HexagonPoint[5].X-skew_value;
        HexagonPoint[6].X:=HexagonPoint[6].X-skew_value;
        HexagonPoint[7].X:=HexagonPoint[1].X;
     end
     else if VerticalSkew.Active = True then
     begin
        HexagonPoint[1].Y:=HexagonPoint[1].Y+skew_value;
        HexagonPoint[2].Y:=HexagonPoint[2].Y+skew_value;
        HexagonPoint[3].Y:=HexagonPoint[3].Y-skew_value;
        HexagonPoint[4].Y:=HexagonPoint[4].Y-skew_value;
        HexagonPoint[5].Y:=HexagonPoint[5].Y-skew_value;
        HexagonPoint[6].Y:=HexagonPoint[6].Y+skew_value;
        HexagonPoint[7].Y:=HexagonPoint[1].Y;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     if HorizontalSkew.Active = True then
     begin
        TrianglePoint[1].X:=TrianglePoint[1].X-skew_value;
        TrianglePoint[2].X:=TrianglePoint[2].X+skew_value;
        TrianglePoint[3].X:=TrianglePoint[3].X-skew_value;
        TrianglePoint[4].X:=TrianglePoint[1].X;
     end
     else if VerticalSkew.Active = True then
     begin
        TrianglePoint[1].Y:=TrianglePoint[1].Y+skew_value;
        TrianglePoint[2].Y:=TrianglePoint[2].Y;
        TrianglePoint[3].Y:=TrianglePoint[3].Y-skew_value;
        TrianglePoint[4].Y:=TrianglePoint[1].Y;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     if HorizontalSkew.Active = True then
     begin
        RhombusPoint[1].X:=RhombusPoint[1].X;
        RhombusPoint[2].X:=RhombusPoint[2].X+skew_value;
        RhombusPoint[3].X:=RhombusPoint[3].X;
        RhombusPoint[4].X:=RhombusPoint[4].X-skew_value;
        RhombusPoint[5].X:=RhombusPoint[1].X;
     end
     else if VerticalSkew.Active = True then
     begin
        RhombusPoint[1].Y:=RhombusPoint[1].Y+skew_value;
        RhombusPoint[2].Y:=RhombusPoint[2].Y;
        RhombusPoint[3].Y:=RhombusPoint[3].Y-skew_value;
        RhombusPoint[4].Y:=RhombusPoint[4].Y;
        RhombusPoint[5].Y:=RhombusPoint[1].Y;
     end;
  end;

  DrawObject(Sender);
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

procedure TForm1.SpinSkewChange(Sender: TObject);
begin
  skew_value:= SpinSkew.Value;
end;

procedure TForm1.SquareBtnClick(Sender: TObject);
begin
  selected_object:= 'Square';
end;

procedure TForm1.TriangleBtnClick(Sender: TObject);
begin
  selected_object:= 'Triangle';
end;

procedure TForm1.UpBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if selected_object = 'Square' then
  begin
     for i:=1 to 5 do
     begin
          SquarePoint[i].Y:=SquarePoint[i].Y-move_value;
     end;
  end
  else if selected_object = 'Circle' then
  begin
     for i:=1 to 2 do
     begin
          CirclePoint[i].Y:=CirclePoint[i].Y-move_value;
     end;
  end
  else if selected_object = 'Pentagon' then
  begin
     for i:=1 to 6 do
     begin
          PentagonPoint[i].Y:=PentagonPoint[i].Y-move_value;
     end;
  end
  else if selected_object = 'Hexagon' then
  begin
     for i:=1 to 7 do
     begin
          HexagonPoint[i].Y:=HexagonPoint[i].Y-move_value;
     end;
  end
  else if selected_object = 'Triangle' then
  begin
     for i:=1 to 4 do
     begin
          TrianglePoint[i].Y:=TrianglePoint[i].Y-move_value;
     end;
  end
  else if selected_object = 'Rhombus' then
  begin
     for i:=1 to 5 do
     begin
          RhombusPoint[i].Y:=RhombusPoint[i].Y-move_value;
     end;
  end;

  MidPoint;
  DrawObject(Sender);
end;

procedure TForm1.VerticalSkewClick(Sender: TObject);
begin
  SkewingObject(Sender);
end;

procedure TForm1.WidthSpinChange(Sender: TObject);
begin
  line_width:= WidthSpin.Value;
  CanvasBox.Canvas.Pen.Width:= line_width;
end;

procedure TForm1.WidthSpinClick(Sender: TObject);
begin

end;

procedure TForm1.DrawObject(Sender: TObject);
begin
  ClearButtonClick(Sender);
  //CanvasBox.Canvas.Brush.Color:=clWhite;
  //CanvasBox.Canvas.Brush.Style:=bsSolid;
  //CanvasBox.Canvas.Pen.Color:=clWhite;
  //CanvasBox.Canvas.FillRect(0,0,CanvasBox.Width,CanvasBox.Height);

  CanvasBox.Canvas.Pen.Color:=line_color;
  CanvasBox.Canvas.Pen.Width:=line_width;
  CanvasBox.Canvas.Pen.Style:=style_line;

  if (selected_object = 'Square') then
  begin
    CanvasBox.Canvas.Polyline(SquarePoint);
    bitmap.Canvas.Polyline(SquarePoint);
  end
  else if (selected_object = 'Circle') then
  begin
    CanvasBox.Canvas.Ellipse(CirclePoint[1].x,CirclePoint[1].y,CirclePoint[2].x,CirclePoint[2].y);
    bitmap.Canvas.Ellipse(CirclePoint[1].x,CirclePoint[1].y,CirclePoint[2].x,CirclePoint[2].y);
  end
  else if (selected_object = 'Pentagon') then
  begin
    CanvasBox.Canvas.Polyline(PentagonPoint);
    bitmap.Canvas.Polyline(PentagonPoint);
  end
  else if (selected_object = 'Hexagon') then
  begin
    CanvasBox.Canvas.Polyline(HexagonPoint);
    bitmap.Canvas.Polyline(HexagonPoint);
  end
  else if (selected_object = 'Triangle') then
  begin
    CanvasBox.Canvas.Polyline(TrianglePoint);
    bitmap.Canvas.Polyline(TrianglePoint);
  end
  else if (selected_object = 'Rhombus') then
  begin
    CanvasBox.Canvas.Polyline(RhombusPoint);
    bitmap.Canvas.Polyline(RhombusPoint);
  end;
end;

procedure TForm1.MidPoint;
var
  i, tx, ty : Integer;
begin
  tx:=0; ty:=0;

  if (selected_object = 'Square') then
  begin
     for i:=1 to 4 do
     begin
          tx := tx + SquarePoint[i].x;
     end;
     for i:=1 to 4 do
     begin
           ty := ty + SquarePoint[i].y;
     end;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
  end
  else if (selected_object = 'Circle') then
  begin
     TOB.x := round((CirclePoint[1].x+CirclePoint[2].x)/2);
     TOB.y := round((CirclePoint[1].y+CirclePoint[2].y)/2);
     r:=CirclePoint[2].X-TOB.X;
  end
  else if (selected_object = 'Pentagon') then
  begin
     for i:=1 to 5 do
     begin
          tx := tx + PentagonPoint[i].x;
     end;
     for i:=1 to 5 do
     begin
           ty := ty + PentagonPoint[i].y;
     end;
     TOB.x := round(tx/5);
     TOB.y := round(ty/5);
  end
  else if (selected_object = 'Hexagon') then
  begin
     for i:=1 to 6 do
     begin
          tx := tx + HexagonPoint[i].x;
     end;
     for i:=1 to 6 do
     begin
           ty := ty + HexagonPoint[i].y;
     end;
     TOB.x := round(tx/6);
     TOB.y := round(ty/6);
  end
  else if (selected_object = 'Triangle') then
  begin
     for i:=1 to 3 do
     begin
          tx := tx + TrianglePoint[i].x;
     end;
     for i:=1 to 3 do
     begin
           ty := ty + TrianglePoint[i].y;
     end;
     TOB.x := round(tx/3);
     TOB.y := round(ty/3);
  end
  else if (selected_object = 'Rhombus') then
  begin
     for i:=1 to 4 do
     begin
          tx := tx + RhombusPoint[i].x;
     end;
     for i:=1 to 4 do
     begin
           ty := ty + RhombusPoint[i].y;
     end;
     TOB.x := round(tx/4);
     TOB.y := round(ty/4);
  end;
end;

end.

