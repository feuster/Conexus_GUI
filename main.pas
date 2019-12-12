unit Main;

{$mode objfpc}{$H+}

{____________________________________________________________
|  _______________________________________________________  |
| |                                                       | |
| |    Remote Tool for Frontier Silicon based devices     | |
| | (c) 2019 Alexander Feuster (alexander.feuster@web.de) | |
| |            https://www.github.com/feuster             | |
| |_______________________________________________________| |
|___________________________________________________________}

//define program basics

interface

uses
  Classes, SysUtils, FileUtil, Interfaces, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, FrontierSiliconAPI,
  fphttpclient, IniFiles, StrUtils, SplashScreen, PIN, Name;

type

  { TMainForm }

  TMainForm = class(TForm)
    ControlFrequencyPanel: TPanel;
    ControlDABPanel: TPanel;
    EqualizerPanel: TPanel;
    EqualizerGroupBox: TGroupBox;
    EqualizerTrackBar2: TTrackBar;
    ManualEqualizerSettingImage1: TImage;
    ManualEqualizerSettingImage2: TImage;
    ManualEqualizerSettingLabel4: TLabel;
    ManualEqualizerSettingLabel3: TLabel;
    ManualEqualizerSettingLabel1: TLabel;
    ManualEqualizerSettingLabel2: TLabel;
    ManualEqualizerSettingLabel5: TLabel;
    ManualEqualizerSettingLabel6: TLabel;
    ManualEqualizerSettingLabel7: TLabel;
    ManualEqualizerSettingLabel8: TLabel;
    PresetAddButton10: TSpeedButton;
    PresetAddButton2: TSpeedButton;
    PresetAddButton3: TSpeedButton;
    PresetAddButton4: TSpeedButton;
    PresetAddButton5: TSpeedButton;
    PresetAddButton6: TSpeedButton;
    PresetAddButton7: TSpeedButton;
    PresetAddButton8: TSpeedButton;
    PresetAddButton9: TSpeedButton;
    PresetNameLabel1: TLabel;
    PresetNameLabel10: TLabel;
    PresetNameLabel2: TLabel;
    PresetNameLabel3: TLabel;
    PresetNameLabel4: TLabel;
    PresetNameLabel5: TLabel;
    PresetNameLabel6: TLabel;
    PresetNameLabel7: TLabel;
    PresetNameLabel8: TLabel;
    PresetNameLabel9: TLabel;
    PresetPlayButton10: TSpeedButton;
    PresetPlayButton2: TSpeedButton;
    PresetPlayButton3: TSpeedButton;
    PresetPlayButton4: TSpeedButton;
    PresetPlayButton5: TSpeedButton;
    PresetPlayButton6: TSpeedButton;
    PresetPlayButton7: TSpeedButton;
    PresetPlayButton8: TSpeedButton;
    PresetPlayButton9: TSpeedButton;
    EqualizerRadioGroup: TRadioGroup;
    SetPresetPanel: TPanel;
    RadioPanel: TPanel;
    HighFreqLabel: TLabel;
    MidFreqLabel: TLabel;
    LowFreqLabel: TLabel;
    SleepTimerStateIdleTimer: TIdleTimer;
    SleepTimerComboBox: TComboBox;
    ControlButtonsPanel1: TPanel;
    ControlButtonsPanel2: TPanel;
    DebugTimer: TTimer;
    IdleTimer: TIdleTimer;
    ModeImageList: TImageList;
    PlayInfoText: TLabel;
    PlayInfoArtist: TLabel;
    PlayInfoName: TLabel;
    CoverImage: TImage;
    NotifyMemo: TMemo;
    NavigationListView: TListView;
    NavigationTabSheet: TTabSheet;
    NavigationPanel: TPanel;
    DebugPanel: TPanel;
    NotifyTimer: TTimer;
    ControlVolumePanel: TPanel;
    PlayInfoPanel: TPanel;
    PlayButton: TSpeedButton;
    PauseButton: TSpeedButton;
    PreviousButton: TSpeedButton;
    NextButton: TSpeedButton;
    PlayPauseButton: TSpeedButton;
    PresetsRadioGroup: TRadioGroup;
    RadioTabSheet: TTabSheet;
    FreqMinusButton: TSpeedButton;
    FreqPlusButton: TSpeedButton;
    Frequency: TTrackBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PresetPlayButton1: TSpeedButton;
    PresetAddButton1: TSpeedButton;
    EqualizerTabSheet: TTabSheet;
    EqualizerTrackBar1: TTrackBar;
    VolumeBarImage: TImage;
    VolPlusButton: TSpeedButton;
    VolMinusButton: TSpeedButton;
    Button1: TButton;
    DeviceImage: TImage;
    DeviceImageList: TImageList;
    DeviceListRefreshButton: TSpeedButton;
    DeviceOffImage: TImage;
    DeviceListView: TListView;
    DeviceBigImageList: TImageList;
    DeviceOnImage: TImage;
    DeviceMuteImage: TImage;
    DeviceMuteOffImage: TImage;
    LabelDeviceNameID: TLabel;
    LabelDeviceIP: TLabel;
    LabelDeviceNetwork: TLabel;
    LabelDevicePIN: TLabel;
    LabelDeviceSoftware: TLabel;
    LogMemo: TMemo;
    PageControl1: TPageControl;
    DeviceListPanel: TPanel;
    DeviceInfoPanel: TPanel;
    PageControlPanel: TPanel;
    ControlPanel: TPanel;
    ModesRadioGroup: TRadioGroup;
    ControlMainControlsPanel: TPanel;
    StandbyButton: TSpeedButton;
    MutingButton: TSpeedButton;
    DebugTabSheet: TTabSheet;
    ControlTabSheet: TTabSheet;
    DeviceListTabSheet: TTabSheet;
    Volume: TTrackBar;
    ScaleImage: TImage;
    procedure ControlButtonsPanel2Resize(Sender: TObject);
    procedure ControlFrequencyPanelResize(Sender: TObject);
    procedure DeviceMuteImageClick(Sender: TObject);
    procedure DeviceMuteOffImageClick(Sender: TObject);
    procedure DeviceOffImageClick(Sender: TObject);
    procedure DeviceOnImageClick(Sender: TObject);
    procedure DeviceListViewDblClick(Sender: TObject);
    procedure DeviceListViewResize(Sender: TObject);
    procedure EqualizerGroupBoxResize(Sender: TObject);
    procedure EqualizerPanelResize(Sender: TObject);
    procedure EqualizerRadioGroupSelectionChanged(Sender: TObject);
    procedure EqualizerTrackBar1Change(Sender: TObject);
    procedure EqualizerTrackBar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EqualizerTrackBar2Change(Sender: TObject);
    procedure EqualizerTrackBar2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PresetAddButton10Click(Sender: TObject);
    procedure PresetAddButton1Click(Sender: TObject);
    procedure PresetAddButton2Click(Sender: TObject);
    procedure PresetAddButton3Click(Sender: TObject);
    procedure PresetAddButton4Click(Sender: TObject);
    procedure PresetAddButton5Click(Sender: TObject);
    procedure PresetAddButton6Click(Sender: TObject);
    procedure PresetAddButton7Click(Sender: TObject);
    procedure PresetAddButton8Click(Sender: TObject);
    procedure PresetAddButton9Click(Sender: TObject);
    procedure PresetPlayButton10Click(Sender: TObject);
    procedure PresetPlayButton1Click(Sender: TObject);
    procedure PresetPlayButton2Click(Sender: TObject);
    procedure PresetPlayButton3Click(Sender: TObject);
    procedure PresetPlayButton4Click(Sender: TObject);
    procedure PresetPlayButton5Click(Sender: TObject);
    procedure PresetPlayButton6Click(Sender: TObject);
    procedure PresetPlayButton7Click(Sender: TObject);
    procedure PresetPlayButton8Click(Sender: TObject);
    procedure PresetPlayButton9Click(Sender: TObject);
    procedure RadioPanelResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FreqMinusButtonClick(Sender: TObject);
    procedure FreqPlusButtonClick(Sender: TObject);
    procedure FrequencyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IdleTimerTimer(Sender: TObject);
    procedure LabelDeviceNameIDClick(Sender: TObject);
    procedure LabelDeviceNameIDMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LabelDevicePINClick(Sender: TObject);
    procedure LabelDevicePINMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LabelDeviceSoftwareClick(Sender: TObject);
    procedure LabelDeviceSoftwareMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LogMemoChange(Sender: TObject);
    procedure ModesRadioGroupSelectionChanged(Sender: TObject);
    procedure NavigationListViewClick(Sender: TObject);
    procedure NavigationListViewResize(Sender: TObject);
    procedure NotifyMemoChange(Sender: TObject);
    procedure DeviceListPanelResize(Sender: TObject);
    procedure DeviceInfoPanelResize(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControlPanelResize(Sender: TObject);
    procedure ControlPanelResize(Sender: TObject);
    procedure ControlMainControlsPanelResize(Sender: TObject);
    procedure NavigationPanelResize(Sender: TObject);
    procedure DebugPanelResize(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);
    procedure PlayInfoPanelResize(Sender: TObject);
    procedure PlayPauseButtonClick(Sender: TObject);
    procedure PresetsRadioGroupSelectionChanged(Sender: TObject);
    procedure PreviousButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure SetPresetPanelResize(Sender: TObject);
    procedure SleepTimerComboBoxSelect(Sender: TObject);
    procedure SleepTimerStateIdleTimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure StandbyButtonClick(Sender: TObject);
    procedure MutingButtonClick(Sender: TObject);
    procedure DebugTimerTimer(Sender: TObject);
    procedure NotifyTimerTimer(Sender: TObject);
    procedure Lock_Controls;
    procedure Unlock_Controls;
    procedure CoverImage_Clear;
    procedure CoverImage_Load(URL: String);
    procedure CoverImage_Show;
    procedure Presets_Reset;
    procedure Preset_Selected_Update;
    procedure Preset_Play(PresetIndex: Integer);
    procedure Preset_Add(PresetID: Integer);
    procedure Preset_Labels;
    procedure ActualDevice_Reset;
    procedure DeviceList_Reset;
    function DeviceList_Update: Boolean;
    function DeviceList_Show: Boolean;
    procedure DeviceList_Save;
    procedure Device_NetworkStatus;
    procedure Device_Selected;
    procedure Device_Device_On(const Read_Standby_State: Boolean = true);
    procedure Device_Sleeptimer_Time;
    procedure Device_Muting_On;
    procedure Device_Presets;
    procedure Device_Navigation;
    procedure Device_PlayInfo;
    procedure Device_PlayInfoClear;
    procedure Ini_Write;
    procedure Ini_Write_Value(Section: String; Ident: String; Value: String);
    function Ini_Read_Value(Section: String; Ident: String): String;
    procedure DeviceListRefreshButtonClick(Sender: TObject);
    procedure VolMinusButtonClick(Sender: TObject);
    procedure VolPlusButtonClick(Sender: TObject);
    procedure FirstStartSplashscreen;
    {$IFDEF PROG_DEBUG}
    procedure Log(AddText: String);
    {$ENDIF}
    procedure VolumeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlVolumePanelResize(Sender: TObject);
  private
    procedure OnExcept(Sender: TObject; E: Exception);
  public

  end;

type
  TNotifyThread = class(TThread)
  private
    fNotifies: TStringList;
  protected
    procedure Execute; override;
  public
    Constructor Create(CreateSuspended : boolean);
    procedure GetNotifies;
  end;

type
	TEqualizer = record
    EqualizerList:    TStringList;
    CustomEqualizer:  TStringList;
    ActiveEqualizer:  Integer;
  end;

type
	TDevice = record
		IP:               String;
    Name:             String;
    ID:               String;
    IconUrl:          String;
    Icon:             TBitmap;
    PIN:              String;
    Device_On:        Boolean;
    Muting_On:        Boolean;
    Modes:            TStringList;
    Mode:             Integer;
    ModeID:           String;
    FM_Min:           Integer;
    FM_Max:           Integer;
    FM_Steps:         Integer;
    Equalizer:        TEqualizer;
	end;

type
	TPreset = record
    ID:               String;
    Name:             String;
  end;


var
  MainForm:         TMainForm;
  ActualDevice:     TDevice;
  DeviceList:       array [0..63] of TDevice;
  Presets:          array [0..31] of TPreset;
  FirstStart:       Boolean = true;
  NotifyThread:     TNotifyThread;
  NotifyEnabled:    Boolean;
  PresetLocked:     Boolean;
  ModeLocked:       Boolean;
  SleepTimerLocked: Boolean;
  EqualizerLocked:  Boolean;
  PlayImageFile:    String;

const
  PINs:           array [0..3] of String = ('1234', '1111', '0000', '1337');
  STR_Date:       String = {$I %DATE%};

  { Simple Encryption Routine:
    Number = Index CryptKey for e.g. Index "3" with CryptKey1 = "1"
    Simple Decryption Routine:
    Number = Index DecryptKey for e.g. crypted Index "1" with DecryptKey1 = "3"
    Keychange:
    To obfusicate PINs with the same single number for e.g. "1111" the key is alternating between key 1 and 2

                 Key pair 1               Key pair 2
    Crypt Key:   3 7 9 1 8 2 4 5 0 6      8 9 3 7 2 4 1 0 6 5
    Decrypt Key: 0 1 2 3 4 5 6 7 8 9      0 1 2 3 4 5 6 7 8 9  }
  PINCryptKey1:   array [0..9] of String = ( '3', '7', '9', '1', '8', '2', '4', '5', '0', '6');
  PINDecryptKey1: array [0..9] of String = ( '8', '3', '5', '0', '6', '7', '9', '1', '4', '2');
  PINCryptKey2:   array [0..9] of String = ( '8', '9', '3', '7', '2', '4', '1', '0', '6', '5');
  PINDecryptKey2: array [0..9] of String = ( '7', '6', '4', '2', '5', '9', '8', '3', '0', '1');

implementation

{$R *.lfm}


{ TMainForm }
{$IFDEF PROG_DEBUG}
procedure TMainForm.Log(AddText: String);
//Debug log
begin
  LogMemo.Append(AddText);
end;
{$ENDIF}

procedure TMainForm.OnExcept(Sender: TObject; E: Exception);
//own Exception handler
begin
  {$IFDEF PROG_DEBUG}
  if E<>NIL then
    begin
      Log(Sender.UnitName+' -> '+Sender.ToString+' -> '+E.Message);
      ShowMessage(Sender.UnitName+' -> '+Sender.ToString+' -> '+E.Message);
    end;
  {$ELSE}
  if E<>NIL then
    ShowMessage(Sender.UnitName+' -> '+Sender.ToString+' -> '+E.Message);
  {$ENDIF}
  if E<>NIL then
    E.Free;
end;

constructor TNotifyThread.Create(CreateSuspended : boolean);
//create Notify thread
begin
  inherited Create(CreateSuspended); // because this is black box in OOP and can reset inherited to the opposite again...
  FreeOnTerminate := True;  // better code...
end;

procedure TNotifyThread.GetNotifies;
//read notifies
begin
  if fNotifies<>NIL then
    MainForm.NotifyMemo.Lines.AddStrings(fNotifies);
end;

procedure TNotifyThread.Execute;
//run Notify thread
begin
  if NotifyEnabled=false then
    exit;
  if fNotifies=NIL then
    begin
      fNotifies:=TStringList.Create;
      fNotifies.Clear;
    end;
  while (not Terminated) do
    begin
      //read notifies from device
      try
      if (ActualDevice.IP<>'') and (ActualDevice.PIN<>'') then
        try
        fNotifies:=fsapi_Info_GetNotifies(ActualDevice.IP,ActualDevice.PIN);
        except
        fNotifies.Clear;
        end;
      finally
      if fNotifies.Count>0 then
        begin
          try
          Synchronize(@GetNotifies);
          finally
          fNotifies.Clear;
          end;
        end;
      end;
    end;
end;

function CryptPIN(PIN: String): String;
//Simple Crypt PIN
var
  Index: Integer;

begin
  Result:='';
  for Index:=1 to Length(PIN) do
    begin
      if Index MOD 2 = 0 then
        Result:=Result+PINCryptKey1[StrToInt(PIN[INDEX])]
      else
        Result:=Result+PINCryptKey2[StrToInt(PIN[INDEX])];
    end;
end;

function DeCryptPIN(PIN: String): String;
//Simple Decrypt PIN
var
  Index: Integer;

begin
  Result:='';
  for Index:=1 to Length(PIN) do
    begin
      if Index MOD 2 = 0 then
        Result:=Result+PINDecryptKey1[StrToInt(PIN[INDEX])]
      else
        Result:=Result+PINDecryptKey2[StrToInt(PIN[INDEX])];
    end;
end;

function DoSplit(Data: String; Index: Byte): String;
//Split data fields
var
  Buffer: TStringList;

begin
  //extract field from data
  Buffer:=TStringList.Create;
  Buffer.StrictDelimiter:=true;
  Buffer.Delimiter:='|';
  Buffer.DelimitedText:=Data;
  if Index<Buffer.Count then
    Result:=Buffer[Index]
  else
    Result:='';
  if Buffer<>NIL then
    Buffer.Free;
end;

procedure TMainForm.CoverImage_Clear;
//clear content image
begin
  CoverImage.Picture.Clear;
  if ActualDevice.Device_On=false then
    exit;

  //Default pictures
  if UpperCase(ActualDevice.ModeID)='DAB' then
    begin
      ModeImageList.GetBitmap(1,CoverImage.Picture.Bitmap);
      PlayImageFile:='DAB';
    end
  else if UpperCase(ActualDevice.ModeID)='FM' then
    begin
      ModeImageList.GetBitmap(2,CoverImage.Picture.Bitmap);
      PlayImageFile:='FM';
    end
  else if UpperCase(ActualDevice.ModeID)='IR' then
    begin
      ModeImageList.GetBitmap(3,CoverImage.Picture.Bitmap);
      PlayImageFile:='IR';
    end
  else if UpperCase(ActualDevice.ModeID)='MP' then
    begin
      ModeImageList.GetBitmap(4,CoverImage.Picture.Bitmap);
      PlayImageFile:='MP';
    end
  else if UpperCase(ActualDevice.ModeID)='AUXIN' then
    begin
      ModeImageList.GetBitmap(5,CoverImage.Picture.Bitmap);
      PlayImageFile:='AUXIN';
    end
  else if UpperCase(ActualDevice.ModeID)='DMR' then
    begin
      ModeImageList.GetBitmap(6,CoverImage.Picture.Bitmap);
      PlayImageFile:='DMR';
    end
  else if UpperCase(ActualDevice.ModeID)='SPOTIFY' then
    begin
      ModeImageList.GetBitmap(7,CoverImage.Picture.Bitmap);
      PlayImageFile:='SPOTIFY';
    end
  else if UpperCase(ActualDevice.ModeID)='BLUETOOTH' then
    begin
      ModeImageList.GetBitmap(8,CoverImage.Picture.Bitmap);
      PlayImageFile:='BLUETOOTH';
    end
  else if UpperCase(ActualDevice.ModeID)='AIRABLE_TIDAL' then
    begin
      ModeImageList.GetBitmap(9,CoverImage.Picture.Bitmap);
      PlayImageFile:='TIDAL';
    end
  else if UpperCase(ActualDevice.ModeID)='AIRABLE_NAPSTER' then
    begin
      ModeImageList.GetBitmap(10,CoverImage.Picture.Bitmap);
      PlayImageFile:='NAPSTER';
    end
  else if UpperCase(ActualDevice.ModeID)='AIRABLE_DEEZER' then
    begin
      ModeImageList.GetBitmap(11,CoverImage.Picture.Bitmap);
      PlayImageFile:='DEEZER';
    end
  else if UpperCase(ActualDevice.ModeID)='AIRABLE_QOBUZ' then
    begin
      ModeImageList.GetBitmap(12,CoverImage.Picture.Bitmap);
      PlayImageFile:='QOBUZ';
    end
  else if UpperCase(ActualDevice.ModeID)='CD' then
    begin
      ModeImageList.GetBitmap(13,CoverImage.Picture.Bitmap);
      PlayImageFile:='CD';
    end
  else
    begin
      ModeImageList.GetBitmap(0,CoverImage.Picture.Bitmap);
      PlayImageFile:='Default';
    end;
  {$IFDEF PROG_DEBUG}
  if PlayImageFile<>'Default' then
    Log('CoverImage_Clear -> '+PlayImageFile)
  else
    Log('CoverImage_Clear -> '+PlayImageFile+' for mode '+ActualDevice.ModeID);
  {$ENDIF}
end;

procedure TMainForm.CoverImage_Load(URL: String);
//load content image
var
  HTTPClient:       TFPCustomHTTPClient;
  GraphicStream:    TMemoryStream;

begin
  if (URL='') or (ActualDevice.Device_On=false) then
    begin
      CoverImage_Clear;
      exit;
    end;

  HTTPClient:=TFPCustomHTTPClient.Create(NIL);
  GraphicStream:=TMemoryStream.Create;
  //download content graphic if available
  try
  HTTPClient.SimpleGet(URL,GraphicStream);
  except
  on E:Exception do
    begin
      GraphicStream.Clear;
    end;
  end;
  if HTTPClient<>NIL then HTTPClient.Free;
  if GraphicStream.Size>0 then
    begin
      GraphicStream.Position:=0;
      CoverImage.Picture.Clear;
      CoverImage.Picture.LoadFromStream(GraphicStream);
      PlayImageFile:=URL;
      {$IFDEF PROG_DEBUG}Log('CoverImage_Load -> '+PlayImageFile);{$ENDIF}
    end
  else
    CoverImage_Clear;
end;

procedure TMainForm.CoverImage_Show;
//show content image
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  CoverImage_Load(fsapi_Info_graphicUri(ActualDevice.IP,ActualDevice.PIN));
end;

procedure TMainForm.VolumeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//set volume
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_Volume_Set(ActualDevice.IP,ActualDevice.PIN,Volume.Position);
end;

procedure TMainForm.ControlVolumePanelResize(Sender: TObject);
begin
  VolMinusButton.Left:=0;
  VolMinusButton.Top:=0;
  VolMinusButton.Height:=ControlVolumePanel.ClientHeight;
  VolMinusButton.Width:=VolMinusButton.Height;
  VolPlusButton.Width:=VolMinusButton.Width;
  VolPlusButton.Height:=VolMinusButton.Height;
  VolPlusButton.Left:=ControlVolumePanel.ClientWidth-VolPlusButton.Width;
  VolPlusButton.Top:=VolMinusButton.Top;
  Volume.Left:=VolMinusButton.Width;
  Volume.Top:=VolMinusButton.Top;
  Volume.Width:=ControlVolumePanel.ClientWidth-VolMinusButton.Width-VolPlusButton.Width;
  Volume.Height:=30;
  VolumeBarImage.Left:=Volume.Left;
  VolumeBarImage.Top:=Volume.Height+1;
  VolumeBarImage.Width:=Volume.Width;
  VolumeBarImage.Height:=ControlVolumePanel.ClientHeight-Volume.Height-2;
end;

procedure TMainForm.Device_Device_On(const Read_Standby_State: Boolean = true);
//check actual device standby state
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;

  if Read_Standby_State=true then
    ActualDevice.Device_On:=fsapi_Standby_State(ActualDevice.IP,ActualDevice.PIN);
  if ActualDevice.Device_On=true then
    begin
      DeviceOnImage.Visible:=true;
      DeviceOffImage.Visible:=false;
      SleepTimerComboBox.Visible:=true;
      CoverImage_Show;
      Device_PlayInfo;
      EqualizerTabSheet.TabVisible:=true;
      if (UpperCase(ActualDevice.ModeID)='FM') or (UpperCase(ActualDevice.ModeID)='DAB') then
        RadioTabSheet.TabVisible:=true
      else
        RadioTabSheet.TabVisible:=false;
    end
  else
    begin
      DeviceOnImage.Visible:=false;
      DeviceOffImage.Visible:=true;
      SleepTimerComboBox.Visible:=false;
      SleepTimerStateIdleTimer.Enabled:=false;
      CoverImage_Clear;
      Device_PlayInfoClear;
      EqualizerTabSheet.TabVisible:=false;
      RadioTabSheet.TabVisible:=false;
    end;
end;

procedure TMainForm.Device_Sleeptimer_Time;
//check actual sleeptimer time until shutdown
var
  TimeUntilShutdown: Integer;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  SleepTimerLocked:=true;
  TimeUntilShutdown:=fsapi_Sys_GetSleepTimer(ActualDevice.IP,ActualDevice.PIN);
  {$IFDEF PROG_DEBUG}
  if TimeUntilShutdown=1 then
    Log('Sleeptimer -> '+IntToStr(TimeUntilShutdown)+' second left')
  else if TimeUntilShutdown>1 then
    Log('Sleeptimer -> '+IntToStr(TimeUntilShutdown)+' seconds left')
  else
    Log('Sleeptimer -> time until shutdown unknown');
  {$ENDIF}
  if (TimeUntilShutdown div 60>1) then
    begin
      SleepTimerComboBox.ItemIndex:=(TimeUntilShutdown div 60);
      if SleepTimerStateIdleTimer.Enabled=false then
        SleepTimerStateIdleTimer.Enabled:=true;
    end
  else if TimeUntilShutdown=0 then
    begin
      SleepTimerComboBox.ItemIndex:=0;
      SleepTimerStateIdleTimer.Enabled:=false;
    end
  else
    SleepTimerComboBox.ItemIndex:=1;
  SleepTimerLocked:=false;
end;

procedure TMainForm.Device_Muting_On;
//check actual device muting state
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;

  ActualDevice.Muting_On:=fsapi_Mute_State(ActualDevice.IP,ActualDevice.PIN);
  if ActualDevice.Muting_On=true then
    begin
      DeviceMuteImage.Visible:=true;
      DeviceMuteOffImage.Visible:=false;
    end
  else
    begin
      DeviceMuteImage.Visible:=false;
      DeviceMuteOffImage.Visible:=true;
    end;
end;

procedure TMainForm.Device_Presets;
//check presets
var
  PresetList:   TStringList;
  Preset:       TStringList;
  Index:        Integer;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;

  CoverImage_Clear;
  Presets_Reset;
  PresetsRadioGroup.Items.Clear;
  Application.ProcessMessages;
  sleep(250);

  PresetList:=TStringList.Create;
  Preset:=TStringList.Create;
  PresetList:=fsapi_Presets_List(ActualDevice.IP,ActualDevice.PIN);
  if PresetList.Text='' then
    begin
      PresetsRadioGroup.Visible:=false;
      exit;
    end;
  for Index:=0 to PresetList.Count-1 do
    begin
      Preset.StrictDelimiter:=true;
      Preset.Delimiter:='|';
      Preset.DelimitedText:=PresetList.Strings[Index];
      Presets[Index].Name:=Preset[1];
      Presets[Index].ID:=Preset[0];
      PresetsRadioGroup.Items.Add(Presets[Index].Name);
    end;
  if PresetsRadioGroup.Items.Count>0 then
    begin
      if PresetsRadioGroup.Items.Count<4 then
        PresetsRadioGroup.ChildSizing.EnlargeVertical:=crsAnchorAligning
      else
        PresetsRadioGroup.ChildSizing.EnlargeVertical:=crsHomogenousChildResize;
      PresetsRadioGroup.Visible:=true;
    end
  else
    begin
      PresetsRadioGroup.Visible:=false;
      PresetsRadioGroup.Items.Clear;
    end;
  CoverImage_Show;
  Device_PlayInfo;
  if PresetList<>NIL then PresetList.Free;
  if Preset<>NIL then Preset.Free;
end;

procedure TMainForm.Device_Navigation;
//check navigation
var
  Item:      TListItem;
  NavItems:  TStringList;
  NavItem:   TStringList;
  Index:     Integer;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  NavigationListView.Items.Clear;
  Application.ProcessMessages;
  sleep(25);

  NavItems:=TStringList.Create;
  NavItem:=TStringList.Create;
  NavItems:=fsapi_Nav_List(ActualDevice.IP,ActualDevice.PIN);

  //create default root folder item
  Item:=NavigationListView.Items.Add;
  Item.Caption:='[Index]';
  Item.SubItems.Add('-1');
  Item.SubItems.Add('-1');
  Item.SubItems.Add('-1');

  //add device navigation items
  for Index:=0 to NavItems.Count-1 do
    begin
      NavItem.StrictDelimiter:=true;
      NavItem.Delimiter:='|';
      NavItem.DelimitedText:=NavItems.Strings[Index];

      Item:=NavigationListView.Items.Add;
      Item.Caption:=Trim(NavItem[1]); //Name/Caption
      Item.SubItems.Add(NavItem[0]);  //Index
      Item.SubItems.Add(NavItem[2]);  //Type
      Item.SubItems.Add(NavItem[3]);  //SubType
    end;

  if NavItems<>NIL then NavItems.Free;
  if NavItem<>NIL then NavItem.Free;
end;

procedure TMainForm.Device_PlayInfo;
//actualize play info
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  PlayInfoName.Caption:=  fsapi_Info_Name(ActualDevice.IP,ActualDevice.PIN);
  PlayInfoArtist.Caption:=fsapi_Info_Artist(ActualDevice.IP,ActualDevice.PIN);
  PlayInfoText.Caption:=  fsapi_Info_Text(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.Device_PlayInfoClear;
//clear play info
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  PlayInfoName.Caption:='';
  PlayInfoArtist.Caption:='';
  PlayInfoText.Caption:='';
end;

procedure TMainForm.DeviceInfoPanelResize(Sender: TObject);
//Resize controls on DeviceInfoPanel
var
  Index:  Integer;
  Offset: Integer;

begin
  DeviceImage.Top:=(DeviceInfoPanel.ClientHeight-DeviceImage.Height) div 2;
  DeviceImage.Left:=DeviceImage.Top;
  DeviceOnImage.Top:=DeviceImage.Top+DeviceImage.Height-DeviceOnImage.Height;
  DeviceOnImage.Left:=DeviceImage.Left+DeviceImage.Width-DeviceOnImage.Width;
  DeviceOffImage.Top:=DeviceOnImage.Top;
  DeviceOffImage.Left:=DeviceOnImage.Left;
  DeviceMuteImage.Top:=DeviceOnImage.Top;;
  DeviceMuteImage.Left:=DeviceImage.Left;
  DeviceMuteOffImage.Top:=DeviceOnImage.Top;;
  DeviceMuteOffImage.Left:=DeviceImage.Left;

  LabelDeviceNameID.Height:=(DeviceImage.Height-(4*2)) div 5;
  Offset:=(DeviceInfoPanel.ClientHeight-(5*LabelDeviceNameID.Height)) div 6;
  LabelDeviceNameID.Top:=Offset;
  LabelDeviceNameID.Left:=DeviceImage.Width+(2*DeviceImage.Left);
  LabelDeviceIP.Top:=LabelDeviceNameID.Top+LabelDeviceNameID.Height+Offset;
  LabelDeviceIP.Left:=LabelDeviceNameID.Left;
  LabelDevicePIN.Top:=LabelDeviceIP.Top+LabelDeviceIP.Height+Offset;
  LabelDevicePIN.Left:=LabelDeviceIP.Left;
  LabelDeviceNetwork.Top:=LabelDevicePIN.Top+LabelDevicePIN.Height+Offset;
  LabelDeviceNetwork.Left:=LabelDeviceNameID.Left;
  LabelDeviceSoftware.Top:=LabelDeviceNetwork.Top+LabelDeviceNetwork.Height+Offset;
  LabelDeviceSoftware.Left:=LabelDeviceIP.Left;

  CoverImage.Top:=DeviceImage.Top;
  CoverImage.Width:=DeviceImage.Width;
  CoverImage.Height:=DeviceImage.Height;
  CoverImage.Left:=DeviceInfoPanel.ClientWidth-CoverImage.Top-CoverImage.Width;

  for Index:=0 to DeviceInfoPanel.ControlCount-1 do
    begin
      if DeviceInfoPanel.Controls[Index].ClassName='TLabel' then
        begin
          DeviceInfoPanel.Controls[Index].Width:=DeviceInfoPanel.ClientWidth-(2*DeviceInfoPanel.BevelWidth)-DeviceInfoPanel.Controls[Index].Left;
          DeviceInfoPanel.Controls[Index].Height:=LabelDeviceNameID.Height;
          DeviceInfoPanel.Controls[Index].Font.Height:=DeviceInfoPanel.Controls[Index].Height-2;
        end;
    end;

end;

procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.PageIndex=2 then
    begin
      Preset_Selected_Update;
      Device_Sleeptimer_Time;
    end;
  if PageControl1.PageIndex=4 then
    begin
      if ActualDevice.Equalizer.CustomEqualizer.Count>0 then
        begin
          ManualEqualizerSettingLabel1.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[0],1)+': ';
          ManualEqualizerSettingLabel2.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[0],0);
          ManualEqualizerSettingLabel3.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[0],2);
          ManualEqualizerSettingLabel4.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[0],3);
          EqualizerTrackBar1.Position:=fsapi_Equalizer_CustomParam0_Get(ActualDevice.IP,ActualDevice.PIN);
          ManualEqualizerSettingLabel2.Caption:=IntToStr(EqualizerTrackBar1.Position);
          EqualizerTrackBar1.Min:=StrToInt(ManualEqualizerSettingLabel3.Caption);
          EqualizerTrackBar1.Max:=StrToInt(ManualEqualizerSettingLabel4.Caption);

          ManualEqualizerSettingLabel5.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[1],1)+': ';
          ManualEqualizerSettingLabel6.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[1],0);
          ManualEqualizerSettingLabel7.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[1],2);
          ManualEqualizerSettingLabel8.Caption:=DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[1],3);
          EqualizerTrackBar2.Position:=fsapi_Equalizer_CustomParam1_Get(ActualDevice.IP,ActualDevice.PIN);
          ManualEqualizerSettingLabel6.Caption:=IntToStr(EqualizerTrackBar2.Position);
          EqualizerTrackBar2.Min:=StrToInt(ManualEqualizerSettingLabel7.Caption);
          EqualizerTrackBar2.Max:=StrToInt(ManualEqualizerSettingLabel8.Caption);
        end;
      if EqualizerRadioGroup.ItemIndex=0 then
        begin
          EqualizerTrackBar1.Enabled:=true;
          EqualizerTrackBar2.Enabled:=true;
        end
      else
        begin
          EqualizerTrackBar1.Enabled:=false;
          EqualizerTrackBar2.Enabled:=false;
        end;
    end;

  if (ActualDevice.IP<>'') and (ActualDevice.PIN<>'') then
    begin
      if PageControl1.PageIndex=5 then
        begin
          fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,true)
        end
      else
        begin
          fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,false);
        end;
    end;

  {$IFDEF PROG_DEBUG}
  if PageControl1.PageIndex=0 then
    LogMemo.SelStart:=Length(LogMemo.Lines.Text)+1;
  {$ENDIF}
end;

procedure TMainForm.PageControlPanelResize(Sender: TObject);
begin
  PageControl1.Top:=0;
  PageControl1.Left:=0;
  PageControl1.Width:=MainForm.ClientWidth;
  PageControl1.Height:=MainForm.ClientHeight-DeviceInfoPanel.Height-PlayInfoPanel.Height;
end;

procedure TMainForm.ControlPanelResize(Sender: TObject);
begin
  ModesRadioGroup.Left:=0;
  ModesRadioGroup.Top:=0;
  ModesRadioGroup.Width:=165;
  ModesRadioGroup.Height:=ControlPanel.ClientHeight;
  PresetsRadioGroup.Width:=Round(1.5*ModesRadioGroup.Width);
  ControlMainControlsPanel.Top:=ModesRadioGroup.Top;
  ControlMainControlsPanel.Left:=ModesRadioGroup.Width;
  ControlMainControlsPanel.Height:=ModesRadioGroup.Height;
  ControlMainControlsPanel.Width:=ControlPanel.ClientWidth-ModesRadioGroup.Width-PresetsRadioGroup.Width;
  PresetsRadioGroup.Top:=ModesRadioGroup.Top;
  PresetsRadioGroup.Left:=ControlMainControlsPanel.Left+ControlMainControlsPanel.Width;
  PresetsRadioGroup.Height:=ControlPanel.ClientHeight;
end;

procedure TMainForm.ControlMainControlsPanelResize(Sender: TObject);
begin
  ControlVolumePanel.Left:=4;
  ControlVolumePanel.Top:=4;
  ControlVolumePanel.Width:=ControlMainControlsPanel.ClientWidth-8;
  ControlButtonsPanel2.ClientHeight:=StandbyButton.Height+SleepTimerComboBox.Height;
  ControlButtonsPanel2.Top:=100;
  ControlButtonsPanel2.Left:=(ControlMainControlsPanel.ClientWidth-ControlButtonsPanel2.Width) div 2;
  ControlButtonsPanel1.Top:=220;
  ControlButtonsPanel1.Left:=((ControlMainControlsPanel.ClientWidth-ControlButtonsPanel1.Width) div 2);
end;

procedure TMainForm.NavigationPanelResize(Sender: TObject);
begin
  NavigationListView.Top:=0;
  NavigationListView.Left:=0;
  NavigationListView.Width:=NavigationPanel.ClientWidth;
  NavigationListView.Height:=NavigationPanel.ClientHeight;
end;

procedure TMainForm.DebugPanelResize(Sender: TObject);
begin
  LogMemo.Top:=0;
  LogMemo.Left:=0;
  LogMemo.Height:=DebugPanel.ClientHeight;
  LogMemo.Width:=(DebugPanel.ClientWidth) * 3 div 4;
  NotifyMemo.Top:=LogMemo.Top;
  NotifyMemo.Left:=LogMemo.Width;
  NotifyMemo.Height:=DebugPanel.ClientHeight;
  NotifyMemo.Width:=DebugPanel.ClientWidth-LogMemo.Width;
end;

procedure TMainForm.PauseButtonClick(Sender: TObject);
//device control PLAY
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Play(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.PlayButtonClick(Sender: TObject);
//device control PLAY
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Pause(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.PlayInfoPanelResize(Sender: TObject);
var
  Offset: Integer;
  Index:  Integer;

begin
  CoverImage.Top:=(PlayInfoPanel.ClientHeight-CoverImage.Height) div 2;
  CoverImage.Left:=CoverImage.Top;

  PlayInfoName.Height:=(CoverImage.Height-(2*2)) div 3;
  Offset:=(PlayInfoPanel.ClientHeight-(3*PlayInfoName.Height)) div 4;
  PlayInfoName.Top:=Offset;
  PlayInfoName.Left:=CoverImage.Width+(2*CoverImage.Left);
  PlayInfoArtist.Top:=PlayInfoName.Top+PlayInfoName.Height+Offset;
  PlayInfoArtist.Left:=PlayInfoName.Left;
  PlayInfoText.Top:=PlayInfoArtist.Top+PlayInfoArtist.Height+Offset;
  PlayInfoText.Left:=PlayInfoArtist.Left;
  for Index:=0 to PlayInfoPanel.ControlCount-1 do
    begin
      if PlayInfoPanel.Controls[Index].ClassName='TLabel' then
        begin
          PlayInfoPanel.Controls[Index].Width:=PlayInfoPanel.ClientWidth-(2*PlayInfoPanel.BevelWidth)-PlayInfoPanel.Controls[Index].Left;
          PlayInfoPanel.Controls[Index].Height:=PlayInfoName.Height;
        end;
    end;
end;

procedure TMainForm.PlayPauseButtonClick(Sender: TObject);
//device control PLAY/PAUSE
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_PlayPause(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.PresetsRadioGroupSelectionChanged(Sender: TObject);
//switch preset
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or ((Sender as TRadioGroup).Name<>PresetsRadioGroup.Name) or (PresetLocked=true) then
    exit;
  Lock_Controls;
  Device_PlayInfoClear;
  CoverImage_Clear;
  fsapi_Presets_Set(ActualDevice.IP,ActualDevice.PIN,StrToInt(Presets[PresetsRadioGroup.ItemIndex].ID));
  CoverImage_Show;
  Device_PlayInfo;
  Unlock_Controls;
end;

procedure TMainForm.PreviousButtonClick(Sender: TObject);
//device control PREVIOUS
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Previous(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.NextButtonClick(Sender: TObject);
//device control NEXT
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Next(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.SetPresetPanelResize(Sender: TObject);
var
  Offset: Integer;

begin
  Offset:=(SetPresetPanel.ClientHeight-(5*PresetPlayButton1.Height)) div 6;
  PresetPlayButton1.Left:=Offset;
  PresetPlayButton1.Top:=Offset;
  PresetAddButton1.Left:=((SetPresetPanel.ClientWidth-(2*Offset)) div 2)-PresetAddButton1.Width;
  PresetAddButton1.Top:=Offset;
  PresetNameLabel1.Left:=PresetPlayButton1.Left+PresetPlayButton1.Width;
  PresetNameLabel1.Top:=Offset;
  PresetNameLabel1.Height:=PresetPlayButton1.Height;
  PresetNameLabel1.Width:=PresetAddButton1.Left-PresetNameLabel1.Left;

  PresetPlayButton2.Left:=PresetPlayButton1.Left;
  PresetPlayButton2.Top:=PresetPlayButton1.Top+PresetPlayButton1.Height+Offset;
  PresetAddButton2.Left:=PresetAddButton1.Left;
  PresetAddButton2.Top:=PresetPlayButton2.Top;
  PresetNameLabel2.Left:=PresetPlayButton2.Left+PresetPlayButton2.Width;
  PresetNameLabel2.Top:=PresetPlayButton2.Top;
  PresetNameLabel2.Height:=PresetPlayButton2.Height;
  PresetNameLabel2.Width:=PresetAddButton2.Left-PresetNameLabel2.Left;

  PresetPlayButton3.Left:=PresetPlayButton2.Left;
  PresetPlayButton3.Top:=PresetPlayButton2.Top+PresetPlayButton2.Height+Offset;
  PresetAddButton3.Left:=PresetAddButton2.Left;
  PresetAddButton3.Top:=PresetPlayButton3.Top;
  PresetNameLabel3.Left:=PresetPlayButton3.Left+PresetPlayButton3.Width;
  PresetNameLabel3.Top:=PresetPlayButton3.Top;
  PresetNameLabel3.Height:=PresetPlayButton3.Height;
  PresetNameLabel3.Width:=PresetAddButton3.Left-PresetNameLabel3.Left;

  PresetPlayButton4.Left:=PresetPlayButton3.Left;
  PresetPlayButton4.Top:=PresetPlayButton3.Top+PresetPlayButton3.Height+Offset;
  PresetAddButton4.Left:=PresetAddButton3.Left;
  PresetAddButton4.Top:=PresetPlayButton4.Top;
  PresetNameLabel4.Left:=PresetPlayButton4.Left+PresetPlayButton4.Width;
  PresetNameLabel4.Top:=PresetPlayButton4.Top;
  PresetNameLabel4.Height:=PresetPlayButton4.Height;
  PresetNameLabel4.Width:=PresetAddButton4.Left-PresetNameLabel4.Left;

  PresetPlayButton5.Left:=PresetPlayButton4.Left;
  PresetPlayButton5.Top:=PresetPlayButton4.Top+PresetPlayButton4.Height+Offset;
  PresetAddButton5.Left:=PresetAddButton4.Left;
  PresetAddButton5.Top:=PresetPlayButton5.Top;
  PresetNameLabel5.Left:=PresetPlayButton5.Left+PresetPlayButton5.Width;
  PresetNameLabel5.Top:=PresetPlayButton5.Top;
  PresetNameLabel5.Height:=PresetPlayButton5.Height;
  PresetNameLabel5.Width:=PresetAddButton5.Left-PresetNameLabel5.Left;

  PresetPlayButton6.Left:=((SetPresetPanel.ClientWidth+(2*Offset)) div 2);
  PresetPlayButton6.Top:=Offset;
  PresetAddButton6.Left:=SetPresetPanel.ClientWidth-Offset-PresetAddButton6.Width;
  PresetAddButton6.Top:=Offset;
  PresetNameLabel6.Left:=PresetPlayButton6.Left+PresetPlayButton6.Width;
  PresetNameLabel6.Top:=Offset;
  PresetNameLabel6.Height:=PresetPlayButton6.Height;
  PresetNameLabel6.Width:=PresetAddButton6.Left-PresetNameLabel6.Left;

  PresetPlayButton7.Left:=PresetPlayButton6.Left;
  PresetPlayButton7.Top:=PresetPlayButton6.Top+PresetPlayButton6.Height+Offset;
  PresetAddButton7.Left:=PresetAddButton6.Left;
  PresetAddButton7.Top:=PresetPlayButton7.Top;
  PresetNameLabel7.Left:=PresetPlayButton7.Left+PresetPlayButton7.Width;
  PresetNameLabel7.Top:=PresetPlayButton7.Top;
  PresetNameLabel7.Height:=PresetPlayButton7.Height;
  PresetNameLabel7.Width:=PresetAddButton7.Left-PresetNameLabel7.Left;

  PresetPlayButton8.Left:=PresetPlayButton7.Left;
  PresetPlayButton8.Top:=PresetPlayButton7.Top+PresetPlayButton7.Height+Offset;
  PresetAddButton8.Left:=PresetAddButton7.Left;
  PresetAddButton8.Top:=PresetPlayButton8.Top;
  PresetNameLabel8.Left:=PresetPlayButton8.Left+PresetPlayButton8.Width;
  PresetNameLabel8.Top:=PresetPlayButton8.Top;
  PresetNameLabel8.Height:=PresetPlayButton8.Height;
  PresetNameLabel8.Width:=PresetAddButton8.Left-PresetNameLabel8.Left;

  PresetPlayButton9.Left:=PresetPlayButton8.Left;
  PresetPlayButton9.Top:=PresetPlayButton8.Top+PresetPlayButton8.Height+Offset;
  PresetAddButton9.Left:=PresetAddButton8.Left;
  PresetAddButton9.Top:=PresetPlayButton9.Top;
  PresetNameLabel9.Left:=PresetPlayButton9.Left+PresetPlayButton9.Width;
  PresetNameLabel9.Top:=PresetPlayButton9.Top;
  PresetNameLabel9.Height:=PresetPlayButton9.Height;
  PresetNameLabel9.Width:=PresetAddButton9.Left-PresetNameLabel9.Left;

  PresetPlayButton10.Left:=PresetPlayButton9.Left;
  PresetPlayButton10.Top:=PresetPlayButton9.Top+PresetPlayButton9.Height+Offset;
  PresetAddButton10.Left:=PresetAddButton9.Left;
  PresetAddButton10.Top:=PresetPlayButton10.Top;
  PresetNameLabel10.Left:=PresetPlayButton10.Left+PresetPlayButton10.Width;
  PresetNameLabel10.Top:=PresetPlayButton10.Top;
  PresetNameLabel10.Height:=PresetPlayButton10.Height;
  PresetNameLabel10.Width:=PresetAddButton10.Left-PresetNameLabel10.Left;

end;

procedure TMainForm.SleepTimerComboBoxSelect(Sender: TObject);
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (SleepTimerLocked=true) then
    exit;
  if fsapi_Sys_SetSleepTimer(ActualDevice.IP,ActualDevice.PIN,SleepTimerComboBox.ItemIndex*60)=true then
    begin
      if SleepTimerComboBox.ItemIndex>0 then
        SleepTimerStateIdleTimer.Enabled:=true
      else
        SleepTimerStateIdleTimer.Enabled:=false;
      {$IFDEF PROG_DEBUG}
      if SleepTimerComboBox.ItemIndex>0 then
        Log('Sleeptimer -> set '+IntToStr(SleepTimerComboBox.ItemIndex*60)+' seconds until shutdown')
      else
        Log('Sleeptimer -> off')
      {$ENDIF}
    end;
end;

procedure TMainForm.SleepTimerStateIdleTimerTimer(Sender: TObject);
//check actual sleeptimer time until shutdown
begin
  if SleepTimerComboBox.ItemIndex>0 then
    Device_Sleeptimer_Time;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
//device control PREVIOUS
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Previous(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
//device control NEXT
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Next(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.StandbyButtonClick(Sender: TObject);
//switch standby mode
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_Standby(ActualDevice.IP,ActualDevice.PIN);
  Device_Device_On;
end;

procedure TMainForm.MutingButtonClick(Sender: TObject);
//switch mute mode
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_Mute(ActualDevice.IP,ActualDevice.PIN);
  Device_Muting_On;
end;

procedure TMainForm.DebugTimerTimer(Sender: TObject);
begin
  {$IFDEF PROG_DEBUG}
  if fsapi_Debug_Message<>'' then
    begin
      fsapi_Debug_Message:=StringReplace(fsapi_Debug_Message,FrontierSiliconAPI.STR_Error,'',[rfReplaceAll,rfIgnoreCase]);
      fsapi_Debug_Message:=StringReplace(fsapi_Debug_Message,FrontierSiliconAPI.STR_Info,'',[rfReplaceAll,rfIgnoreCase]);
      Log(fsapi_Debug_Message);
      fsapi_Debug_Message:='';
    end;
  {$ENDIF}
end;

procedure TMainForm.NotifyTimerTimer(Sender: TObject);
//check actual device standby state
var
  Buffer:           String;
  Notify:           String;
  Value:            String;

begin
  while NotifyMemo.Lines.Count>0 do
    begin
      Buffer:=NotifyMemo.Lines.Strings[0];
      Notify:=LeftStr(Buffer,Pos('|',Buffer)-1);
      Value:=RightStr(Buffer,Length(Buffer)-Pos('|',Buffer));
      {$IFDEF PROG_DEBUG}
      Log('Notify -> '+Notify+'='+Value);
      {$ENDIF}
      NotifyMemo.Lines.Delete(0);
      if (ActualDevice.IP<>'') and (ActualDevice.PIN<>'') then
        begin
          if LowerCase(Notify)='netremote.sys.audio.volume' then
            begin
              if StrToInt(Value)>-1 then
                Volume.Position:=StrToInt(Value);
              Device_Muting_On;
            end;
          if LowerCase(Notify)='netremote.sys.power' then
            begin
              if StrToInt(Value)=1 then
                begin
                  ActualDevice.Device_On:=true;
                  Device_Device_On(false);
                end
              else
                begin
                  ActualDevice.Device_On:=false;
                  Device_Device_On(false);
                end;
            end;
          if LowerCase(Notify)='netremote.sys.sleep' then
            begin
              Device_Sleeptimer_Time;
            end;
          if LowerCase(Notify)='netremote.sys.audio.mute' then
            begin
              if StrToInt(Value)=1 then
                begin
                  DeviceMuteImage.Visible:=true;
                  DeviceMuteOffImage.Visible:=false;
                  ActualDevice.Muting_On:=true;
                end
              else
                begin
                  DeviceMuteImage.Visible:=false;
                  DeviceMuteOffImage.Visible:=true;
                  ActualDevice.Muting_On:=false;
                end;
            end;
          if LowerCase(Notify)='netremote.sys.mode' then
            begin
              if StrToInt(Value)>-1 then
                begin
                  ModesRadioGroup.ItemIndex:=StrToInt(Value);
                end;
            end;
          if LowerCase(Notify)='netremote.play.info.graphicUri' then
            begin
              if Value<>'' then
                begin
                  CoverImage_Load(Value);
                end;
            end;
          if LowerCase(Notify)='netremote.play.info.name' then
            begin
              PlayInfoName.Caption:=Value;
              Preset_Selected_Update;
            end;
          if LowerCase(Notify)='netremote.play.info.artist' then
            begin
              PlayInfoArtist.Caption:=Value;
            end;
          if LowerCase(Notify)='netremote.play.info.text' then
            begin
              PlayInfoText.Caption:=Value;
            end;
          if LowerCase(Notify)='netremote.play.status' then
            begin
              Device_PlayInfo;
              Value:=fsapi_Info_graphicUri(ActualDevice.IP,ActualDevice.PIN);
              if Value<>'' then
                begin
                  CoverImage_Load(Value);
                end;
            end;
          if LowerCase(Notify)='netremote.sys.net.wlan.rssi' then
            begin
              Device_NetworkStatus;
            end;
          if LowerCase(Notify)='netremote.sys.net.wlan.connectedssid' then
            begin
              Device_NetworkStatus;
            end;
          if LowerCase(Notify)='netremote.sys.net.wired.interfaceenable' then
            begin
              Device_NetworkStatus;
            end;
          if LowerCase(Notify)='netremote.sys.net.wlan.interfaceenable' then
            begin
              Device_NetworkStatus;
            end;
          if LowerCase(Notify)='netremote.play.frequency' then
            begin
              Device_PlayInfoClear;
              if (StrToInt(Value)>=ActualDevice.FM_Min) and (StrToInt(Value)<=ActualDevice.FM_Max) then
                Frequency.Position:=StrToInt(Value)-ActualDevice.FM_Min;
            end;
          if LowerCase(Notify)='netremote.sys.audio.eqpreset' then
            begin
              if StrToInt(Value)>-1 then
                begin
                  EqualizerLocked:=true;
                  EqualizerRadioGroup.ItemIndex:=StrToInt(Value);
                  EqualizerLocked:=false;
                end;
            end;
        end;
    end;
end;

procedure TMainForm.Lock_Controls;
//Lock MainForm controls
var
  Index: Integer;

begin
  for Index:=0 to MainForm.ControlCount-1 do
    begin
      if MainForm.Controls[Index].ClassName<>'TMemo' then
        begin
          MainForm.Controls[Index].Enabled:=false;
          MainForm.Controls[Index].Refresh;
        end;
    end;
end;

procedure TMainForm.LogMemoChange(Sender: TObject);
{$IFDEF PROG_DEBUG}
var
  Index: Integer;
{$ENDIF}
begin
  {$IFDEF PROG_DEBUG}
  while LogMemo.Lines.Count>500 do
    begin
      LogMemo.Lines.Delete(0);
    end;
  for Index:=LogMemo.Lines.Count-1 downto 0 do
    begin
      if LogMemo.Lines[Index]='' then
        LogMemo.Lines.Delete(Index);
    end;
  LogMemo.SelStart:=Length(LogMemo.Lines.Text)+1;
  {$ENDIF}
  {$IFDEF PROG_DEBUG}
  //Save debug log
  if FileExists(ExtractFilePath(ParamStr(0))+'Log.txt')=true then
    DeleteFile(ExtractFilePath(ParamStr(0))+'Log.txt');
  LogMemo.Lines.SaveToFile(ExtractFilePath(ParamStr(0))+'Log.txt');
  {$ENDIF}
end;

procedure TMainForm.ModesRadioGroupSelectionChanged(Sender: TObject);
//switch mode
var
  Buffer: Integer;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or ((Sender as TRadioGroup).Name<>ModesRadioGroup.Name) or (ModeLocked=true) then
    exit;

  Lock_Controls;
  Application.ProcessMessages;
  if fsapi_Modes_Set(ActualDevice.IP,ActualDevice.PIN,ModesRadioGroup.ItemIndex)=true then
    ActualDevice.Mode:=ModesRadioGroup.ItemIndex
  else
    begin
      ModesRadioGroup.ItemIndex:=fsapi_Modes_ActiveMode(ActualDevice.IP,ActualDevice.PIN);
      ActualDevice.Mode:=ModesRadioGroup.ItemIndex;
    end;

  //show presets if for mode available
  ActualDevice.ModeID:=DoSplit(ActualDevice.Modes.Strings[ModesRadioGroup.ItemIndex],2);
  if (UpperCase(ActualDevice.ModeID)<>'AUXIN') and (UpperCase(ActualDevice.ModeID)<>'BLUETOOTH')
  and (UpperCase(ActualDevice.ModeID)<>'MP') and (UpperCase(ActualDevice.ModeID)<>'DMR')
  and (UpperCase(ActualDevice.ModeID)<>'SPOTIFY') then
    begin
      Device_Presets;
    end
  else
    begin
      PresetsRadioGroup.Visible:=false;
      PresetsRadioGroup.Items.Clear;
      //show play info
      CoverImage_Show;
      Device_PlayInfo;
    end;

  //show FM radio mode control
  if (UpperCase(ActualDevice.ModeID)='FM') then
    begin
      Buffer:=fsapi_FM_FreqRange_LowerCap(ActualDevice.IP,ActualDevice.PIN);
      if Buffer>-1 then
        ActualDevice.FM_Min:=Buffer
      else
        ActualDevice.FM_Min:=87500;
      Buffer:=fsapi_FM_FreqRange_UpperCap(ActualDevice.IP,ActualDevice.PIN);
      if Buffer>-1 then
        ActualDevice.FM_Max:=Buffer
      else
        ActualDevice.FM_Max:=108000;
      Buffer:=fsapi_FM_FreqRange_Steps(ActualDevice.IP,ActualDevice.PIN);
      if Buffer>-1 then
        ActualDevice.FM_Steps:=Buffer
      else
        ActualDevice.FM_Steps:=50;
      ControlFrequencyPanel.Visible:=true;
      ControlDABPanel.Visible:=false;
      Frequency.Min:=0;
      Frequency.Max:=ActualDevice.FM_Max-ActualDevice.FM_Min;
      Frequency.SetTick(ActualDevice.FM_Steps);
      Buffer:=fsapi_FM_GetFrequency(ActualDevice.IP,ActualDevice.PIN);
      if Buffer>-1 then
        Frequency.Position:=Buffer-ActualDevice.FM_Min
      else
        Frequency.Position:=0;
      LowFreqLabel.Caption:=FloatToStr(ActualDevice.FM_Min/1000)+'MHz';
      HighFreqLabel.Caption:=FloatToStr(ActualDevice.FM_Max/1000)+'MHz';
      MidFreqLabel.Caption:=FloatToStr((ActualDevice.FM_Max+ActualDevice.FM_Min)/2000)+'MHz';
      Preset_Labels;
      RadioTabSheet.Caption:=ModesRadioGroup.Items[ModesRadioGroup.ItemIndex];
      RadioTabSheet.TabVisible:=true;
    end
  //show DAB radio mode control
  else if (UpperCase(ActualDevice.ModeID)='DAB') then
    begin
      ControlFrequencyPanel.Visible:=false;
      ControlDABPanel.Visible:=true;
      Preset_Labels;
      RadioTabSheet.Caption:=ModesRadioGroup.Items[ModesRadioGroup.ItemIndex];
      RadioTabSheet.TabVisible:=true;
    end
  else
    RadioTabSheet.TabVisible:=false;

  //show navigation if for mode available
  sleep(25);
  fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,true);
  Device_Navigation;
  if NavigationListView.Items.Count>1 then
    NavigationTabSheet.TabVisible:=true
  else
    NavigationTabSheet.TabVisible:=false;
  fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,false);

  //show device standby state
  Device_Device_On;

  Unlock_Controls;
end;

procedure TMainForm.NavigationListViewClick(Sender: TObject);
//switch navigation
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  Lock_Controls;
  sleep(150);
  if NavigationListView.Selected<>NIL then
    begin
      if NavigationListView.Selected.Index=0 then
        begin
          fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,false);
          sleep(300);
          fsapi_Nav_State(ActualDevice.IP,ActualDevice.PIN,true);
          Device_Navigation;
        end
      else
        begin
          if fsapi_Nav_NavigateSelectItem(ActualDevice.IP,ActualDevice.PIN,StrToInt(NavigationListView.Selected.SubItems[0]),StrToInt(NavigationListView.Selected.SubItems[1]))=true then
            begin
              sleep(300);
              Device_Navigation;
            end;
        end;
    end;
  Unlock_Controls;
end;

procedure TMainForm.NavigationListViewResize(Sender: TObject);
begin
  if NavigationListView.ColumnCount>0 then
    NavigationListView.Columns.Items[0].Width:=NavigationListView.ClientWidth;
end;

procedure TMainForm.NotifyMemoChange(Sender: TObject);
begin
  while NotifyMemo.Lines.Count>500 do
    begin
      NotifyMemo.Lines.Delete(0);
    end;
  NotifyMemo.SelStart:=Length(NotifyMemo.Lines.Text)-1;
end;

procedure TMainForm.DeviceListPanelResize(Sender: TObject);
begin
  DeviceListRefreshButton.Top:=0;
  DeviceListRefreshButton.Left:=0;
  DeviceListRefreshButton.Width:=DeviceListPanel.ClientWidth;
  DeviceListView.Top:=DeviceListRefreshButton.Height;
  DeviceListView.Left:=0;
  DeviceListView.Width:=DeviceListPanel.ClientWidth;
  DeviceListView.Height:=DeviceListPanel.ClientHeight-DeviceListRefreshButton.Height;
end;

procedure TMainForm.Unlock_Controls;
//Unlock MainForm controls
var
  Index: Integer;

begin
  for Index:=0 to MainForm.ControlCount-1 do
    begin
      MainForm.Controls[Index].Enabled:=true;
      MainForm.Controls[Index].Refresh;
    end;
end;

procedure TMainForm.Presets_Reset;
//Reset/init presets
var
  Index: Integer;

begin
  for Index:=0 to Length(Presets)-1 do
    begin
      Presets[Index].ID:='';
      Presets[Index].Name:='';
    end;
end;

procedure TMainForm.Preset_Selected_Update;
//Selected preset update
var
  Index: Integer;

begin
  //try to set actual playing preset in PresetsRadioGroup
  if (PresetsRadioGroup.Items.Count>0) and (PresetsRadioGroup.Visible=true) then
    begin
      for Index:=0 to PresetsRadioGroup.Items.Count-1 do
        begin
          if PresetsRadioGroup.Items[Index]=PlayInfoName.Caption then
            begin
              PresetLocked:=true;
              PresetsRadioGroup.ItemIndex:=Index;
              PresetLocked:=false;
              break;
            end;
        end;
    end;
end;

procedure TMainForm.Preset_Play(PresetIndex: Integer);
//play preset
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (PresetLocked=true) or (PresetIndex<0) then
    exit;
  Lock_Controls;
  Device_PlayInfoClear;
  CoverImage_Clear;
  fsapi_Presets_Set(ActualDevice.IP,ActualDevice.PIN,PresetIndex);
  CoverImage_Show;
  Device_PlayInfo;
  Unlock_Controls;
end;

procedure TMainForm.Preset_Add(PresetID: Integer);
//add preset
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (PresetLocked=true) or (PresetID<0)then
    exit;
  Lock_Controls;
  if fsapi_Presets_Add(ActualDevice.IP,ActualDevice.PIN,PresetID)=true then
    begin
      Device_Presets;
      Preset_Labels;
      {$IFDEF PROG_DEBUG}Log('Preset_Add -> success');{$ENDIF}
    end
  else
    begin
      {$IFDEF PROG_DEBUG}Log('Preset_Add -> failed');{$ENDIF}
    end;
  Unlock_Controls;
end;

procedure TMainForm.Preset_Labels;
//load preset names into labels
var
  Index: Integer;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (PresetLocked=true) then
    exit;

  //set default label text
  PresetNameLabel1.Caption:='Preset 1 frei';
  PresetNameLabel2.Caption:='Preset 2 frei';
  PresetNameLabel3.Caption:='Preset 3 frei';
  PresetNameLabel4.Caption:='Preset 4 frei';
  PresetNameLabel5.Caption:='Preset 5 frei';
  PresetNameLabel6.Caption:='Preset 6 frei';
  PresetNameLabel7.Caption:='Preset 7 frei';
  PresetNameLabel8.Caption:='Preset 8 frei';
  PresetNameLabel9.Caption:='Preset 9 frei';
  PresetNameLabel10.Caption:='Preset 10 frei';

  //overwrite default label text with available preset names
  for Index:=0 to Length(Presets) do
    begin
      if Presets[Index].Name<>'' then
        begin
          if Presets[Index].ID='0' then
            PresetNameLabel1.Caption:='1: '+Presets[Index].Name
          else if Presets[Index].ID='1' then
            PresetNameLabel2.Caption:='2: '+Presets[Index].Name
          else if Presets[Index].ID='2' then
            PresetNameLabel3.Caption:='3: '+Presets[Index].Name
          else if Presets[Index].ID='3' then
            PresetNameLabel4.Caption:='4: '+Presets[Index].Name
          else if Presets[Index].ID='4' then
            PresetNameLabel5.Caption:='5: '+Presets[Index].Name
          else if Presets[Index].ID='5' then
            PresetNameLabel6.Caption:='6: '+Presets[Index].Name
          else if Presets[Index].ID='6' then
            PresetNameLabel7.Caption:='7: '+Presets[Index].Name
          else if Presets[Index].ID='7' then
            PresetNameLabel8.Caption:='8: '+Presets[Index].Name
          else if Presets[Index].ID='8' then
            PresetNameLabel9.Caption:='9: '+Presets[Index].Name
          else if Presets[Index].ID='9' then
            PresetNameLabel10.Caption:='10: '+Presets[Index].Name;
        end;
    end;
end;

procedure TMainForm.DeviceList_Reset;
//Reset/init device list
var
  Index: Integer;

begin
  for Index:=0 to Length(DeviceList)-1 do
    begin
      DeviceList[Index].IP:='';
      DeviceList[Index].PIN:='';
      DeviceList[Index].ID:='';
      DeviceList[Index].IconUrl:='';
      if DeviceList[Index].Icon=NIL then
        DeviceList[Index].Icon:=TBitmap.Create
      else
        DeviceList[Index].Icon.Clear;
      DeviceList[Index].Name:='';
      DeviceList[Index].Device_On:=false;
      DeviceList[Index].Muting_On:=false;
      if DeviceList[Index].Modes=NIL then
        DeviceList[Index].Modes:=TStringList.Create
      else
        DeviceList[Index].Modes.Clear;
      DeviceList[Index].Mode:=-1;
      DeviceList[Index].ModeID:='';
      DeviceList[Index].FM_Min:=0;
      DeviceList[Index].FM_Max:=0;
      DeviceList[Index].FM_Steps:=0;
      DeviceList[Index].Equalizer.ActiveEqualizer:=0;
      if DeviceList[Index].Equalizer.CustomEqualizer=NIL then
        DeviceList[Index].Equalizer.CustomEqualizer:=TStringList.Create
      else
        DeviceList[Index].Equalizer.CustomEqualizer.Clear;
      if DeviceList[Index].Equalizer.EqualizerList=NIL then
        DeviceList[Index].Equalizer.EqualizerList:=TStringList.Create
      else
        DeviceList[Index].Equalizer.EqualizerList.Clear;
    end;

  for Index:=DeviceImageList.Count-1 downto 1do
    begin
      DeviceImageList.Delete(Index);
    end;
  for Index:=DeviceBigImageList.Count-1 downto 1do
    begin
      DeviceBigImageList.Delete(Index);
    end;

  DeviceImage.Picture.Clear;
  DeviceListView.Clear;
  LabelDeviceIP.Caption:='';
  LabelDeviceNameID.Caption:='';
  LabelDeviceNetwork.Caption:='';
  LabelDevicePIN.Caption:='';
  LabelDeviceSoftware.Caption:='';
  ModesRadioGroup.Items.Clear;
  PresetsRadioGroup.Items.Clear;
  PresetsRadioGroup.Visible:=false;
end;

procedure TMainForm.ActualDevice_Reset;
//Reset/init actual device settings
begin
  ActualDevice.IP:='';
  ActualDevice.PIN:='';
  ActualDevice.ID:='';
  ActualDevice.IconUrl:='';
  if ActualDevice.Icon=NIL then
    ActualDevice.Icon:=TBitmap.Create
  else
    ActualDevice.Icon.Clear;
  ActualDevice.Name:='';
  ActualDevice.Device_On:=false;
  ActualDevice.Muting_On:=false;
  if ActualDevice.Modes=NIL then
    ActualDevice.Modes:=TStringList.Create
  else
    ActualDevice.Modes.Clear;
  ActualDevice.Mode:=-1;
  ActualDevice.ModeID:='';
  ActualDevice.FM_Min:=0;
  ActualDevice.FM_Max:=0;
  ActualDevice.FM_Steps:=0;
  ActualDevice.Equalizer.ActiveEqualizer:=0;
  if ActualDevice.Equalizer.CustomEqualizer=NIL then
    ActualDevice.Equalizer.CustomEqualizer:=TStringList.Create
  else
    ActualDevice.Equalizer.CustomEqualizer.Clear;
  if ActualDevice.Equalizer.EqualizerList=NIL then
    ActualDevice.Equalizer.EqualizerList:=TStringList.Create
  else
    ActualDevice.Equalizer.EqualizerList.Clear;
end;


function TMainForm.DeviceList_Update: Boolean;
//Update device list
var
  fsapi_DeviceList: TStringList;
  fsapi_Device:     TStringList;
  HTTPClient:       TFPCustomHTTPClient;
  IconStream:       TMemoryStream;
  IMG:              TPicture;
  Index:            Integer;
  Index2:           Integer;
  Buffer:           String;

begin
  try
  fsapi_DeviceList:=TStringList.Create;
  fsapi_DeviceList:=fsapi_Info_DeviceList(2500,true);
  {$IFDEF PROG_DEBUG}
  for Index:=0 to fsapi_DeviceList.Count-1 do
    Log('DeviceList_Update -> '+fsapi_DeviceList[Index]);
  {$ENDIF}
  if fsapi_DeviceList.Count>0 then
    begin
      DeviceList_Reset;
      for Index:=0 to fsapi_DeviceList.Count-1 do
        begin
          fsapi_Device:=TStringList.Create;
          fsapi_Device.StrictDelimiter:=true;
          fsapi_Device.Delimiter:='|';
          fsapi_Device.DelimitedText:=fsapi_DeviceList.Strings[Index];
          if fsapi_Device.Strings[0]<>'' then
            begin
              DeviceList[Index].IP:=fsapi_Device.Strings[0];
              DeviceList[Index].Name:=fsapi_Device.Strings[1];
              DeviceList[Index].ID:=fsapi_Device.Strings[2];
              DeviceList[Index].IconUrl:=fsapi_Device.Strings[3];

              //read stored PIN if available
              DeviceList[Index].PIN:=DeCryptPIN(Ini_Read_Value('DevicePINList',DeviceList[Index].ID));

              //test if stored PIN is still correct
              if DeviceList[Index].PIN<>'' then
                begin
                  if (DeviceList[Index].IP<>'') and (DeviceList[Index].PIN<>'') then
                    begin
                      fsapi_SessionID:='';
                      Buffer:=fsapi_Info_DeviceID(DeviceList[Index].IP,DeviceList[Index].PIN);
                    end;
                  if Buffer='' then
                    DeviceList[Index].PIN:='';
                end;

              //try to determine a standard PIN if PIN is still not known
              if DeviceList[Index].PIN='' then
                begin
                  for Index2:=0 to Length(PINs)-1 do
                    begin
                      if (DeviceList[Index].IP<>'') then
                        begin
                          fsapi_SessionID:='';
                          Buffer:=fsapi_Info_DeviceID(DeviceList[Index].IP,PINs[Index2]);
                        end;
                      if Buffer<>'' then
                        begin
                          DeviceList[Index].PIN:=PINs[Index2];
                          Break;
                        end;
                    end;
                end;

              //download device icon if available
              try
              if DeviceList[Index].IconUrl<>'' then
                begin
                  //download device icon via HTTP
                  HTTPClient:=TFPCustomHTTPClient.Create(NIL);
                  IconStream:=TMemoryStream.Create;
                  HTTPClient.SimpleGet(DeviceList[Index].IconUrl,IconStream);

                  //scale and use downloaded device icon stream if available
                  if IconStream.Size>0 then
                    begin
                      IconStream.Position:=0;
                      IMG:=TPicture.Create;
                      IMG.LoadFromStream(IconStream);
                      DeviceList[Index].Icon.SetSize(DeviceImageList.Width,DeviceImageList.Height);
                      DeviceList[Index].Icon.PixelFormat:=IMG.Bitmap.PixelFormat;
                      DeviceList[Index].Icon.Transparent:=true;
                      DeviceList[Index].Icon.Canvas.StretchDraw(Rect(0,0,DeviceImageList.Width,DeviceImageList.Height),IMG.Bitmap);
                      IconStream.Position:=0;
                      IMG.Clear;
                      IMG.LoadFromStream(IconStream);
                      DeviceBigImageList.Add(IMG.Bitmap,nil);
                      if IMG<>NIL then IMG.Free;
                    end
                  else
                    begin
                      //use fallback device icon
                      DeviceImageList.GetBitmap(0,DeviceList[Index].Icon);
                    end;
                end;
              except
              on E:Exception do
                begin
                  IconStream.Clear;
                end;
              end;
              if HTTPClient<>NIL then HTTPClient.Free;
          end;
      end;
    end
  else
    begin
      ShowMessage('Es wurden keine kompatiblen Geräte gefunden oder es besteht ein Netzwerkproblem!');
    end;
  Result:=true;
  except
  on E:Exception do
    begin
      DeviceList_Reset;
      Result:=false;
    end;
  end;
end;

function TMainForm.DeviceList_Show: Boolean;
//Load device list into listview
var
  Index:    Integer;
  Buffer:   String;
  ListItem: TListItem;

begin
  try
  DeviceListView.Clear;
  for Index:=0 to Length(DeviceList)-1 do
    begin
      if DeviceList[Index].IP='' then break;
      DeviceImageList.Add(DeviceList[Index].Icon,nil);
      ListItem:=DeviceListView.Items.Add;
      ListItem.Caption:=DeviceList[Index].Name;
      ListItem.ImageIndex:=Index+1;
      ListItem.SubItems.Add(IntToStr(Index));
    end;
  if DeviceListView.Items.Count=0 then
    begin
      Result:=false;
      exit;
    end;
  DeviceListView.ItemIndex:=0;

  //activate last used device if available
  Buffer:=Ini_Read_Value('Settings','LastActiveDevice');
  for Index:=0 to Length(DeviceList)-1 do
    begin
      if DeviceList[Index].ID=Buffer then
        begin
          DeviceListView.ItemIndex:=Index;
          break;
        end;
      if DeviceList[Index].IP='' then
        begin
          break;
        end;
    end;

  Device_Selected;
  Result:=true;

  except
  Result:=false;
  end;
end;

procedure TMainForm.DeviceList_Save;
//Save device list (only devices with known PIN)
var
  Index:    Integer;
  IniFile:  TIniFile;

begin
  IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'Settings.ini');
  IniFile.EraseSection('DevicePINList');
  if IniFile<>NIL then
    begin
      for Index:=0 to Length(DeviceList)-1 do
        begin
          if DeviceList[Index].ID<>'' then
            begin
              IniFile.WriteString('DevicePINList',DeviceList[Index].ID,CryptPIN(DeviceList[Index].PIN));
            end;
          if DeviceList[Index].IP='' then
            break;
        end;
    end;
  if IniFile<>NIL then
    IniFile.Free
end;

procedure TMainForm.Ini_Write;
//Save program settings
var
  IniFile:  TIniFile;

begin
  IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'Settings.ini');
  if IniFile<>NIL then
    begin
      if DeviceListView.ItemIndex>-1 then
        IniFile.WriteString('Settings','LastActiveDevice',DeviceList[DeviceListView.ItemIndex].ID)
      else
        IniFile.WriteString('Settings','LastActiveDevice','');
    end;
  if IniFile<>NIL then
    IniFile.Free
end;

procedure TMainForm.Ini_Write_Value(Section: String; Ident: String; Value: String);
//Save single settings value
var
  IniFile:  TIniFile;

begin
  if Section='' then
    Section:='Settings';
  IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'Settings.ini');
  if IniFile<>NIL then
    begin
      IniFile.WriteString(Section,Ident,Value);
    end;
  if IniFile<>NIL then
    IniFile.Free
end;

function TMainForm.Ini_Read_Value(Section: String; Ident: String): String;
//Read single settings value
var
  IniFile:  TIniFile;

begin
  if Section='' then
    Section:='Settings';
  IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'Settings.ini');
  if IniFile<>NIL then
    begin
      Result:=IniFile.ReadString(Section,Ident,'');
    end;
  if IniFile<>NIL then
    IniFile.Free
end;

procedure TMainForm.DeviceListRefreshButtonClick(Sender: TObject);
//Refresh device list
begin
  Lock_Controls;
  NotifyEnabled:=false;
  DeviceList_Update;
  DeviceList_Show;
  NotifyEnabled:=true;
  Unlock_Controls;
end;

procedure TMainForm.VolMinusButtonClick(Sender: TObject);
//decrease volume
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  if fsapi_Volume_Down(ActualDevice.IP,ActualDevice.PIN)=true then
    Volume.Position:=fsapi_Volume_Get(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.VolPlusButtonClick(Sender: TObject);
//increase volume
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  if fsapi_Volume_Up(ActualDevice.IP,ActualDevice.PIN)=true then
    Volume.Position:=fsapi_Volume_Get(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  try
  //Delete active session ID
  if fsapi_SessionID<>'' then
    begin
      if (ActualDevice.IP<>'') and (ActualDevice.PIN<>'') then
        fsapi_DeleteSession(ActualDevice.IP,ActualDevice.PIN);
    end;
  //Save device list
  DeviceList_Save;
  //Save program settings
  Ini_Write;
  {$IFDEF PROG_DEBUG}
  //Save debug log
  if FileExists(ExtractFilePath(ParamStr(0))+'Log.txt')=true then
    DeleteFile(ExtractFilePath(ParamStr(0))+'Log.txt');
  LogMemo.Lines.SaveToFile(ExtractFilePath(ParamStr(0))+'Log.txt');
  {$ENDIF}
  finally
  CanClose:=true;
  end;
end;

procedure TMainForm.Device_NetworkStatus;
var
  Buffer:   String;
  Buffer2:  String;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  Buffer:=fsapi_Info_Network_Interfaces(ActualDevice.IP,ActualDevice.PIN);
  if UpperCase(Buffer)='LAN' then
    LabelDeviceNetwork.Caption:='Verbindungstyp: '+Buffer
  else
    begin
      LabelDeviceNetwork.Caption:='Verbindungstyp: '+Buffer;
      Buffer:=fsapi_Info_WLAN_ConnectedSSID(ActualDevice.IP,ActualDevice.PIN);
      Buffer2:=fsapi_Info_WLAN_RSSI(ActualDevice.IP,ActualDevice.PIN);
      if (Buffer<>'') and (Buffer2<>'') then
        LabelDeviceNetwork.Caption:=LabelDeviceNetwork.Caption+' (SSID: '+Buffer+' / RSSI: '+Buffer2+')'
      else if (Buffer='') and (Buffer2<>'') then
        LabelDeviceNetwork.Caption:=LabelDeviceNetwork.Caption+' (RSSI: '+Buffer2+')'
      else if (Buffer<>'') and (Buffer2='') then
        LabelDeviceNetwork.Caption:=LabelDeviceNetwork.Caption+' (SSID: '+Buffer2+')';
    end;
end;

procedure TMainForm.Device_Selected;
//device selection done now set device as actual device
var
  Buffer:   TStringList;
  Index:    Integer;

begin
  //check if device is selected
  if DeviceListView.ItemIndex<0 then
    exit;

  ActualDevice_Reset;
  ActualDevice:=DeviceList[StrToInt(DeviceListView.Selected.SubItems[0])];
  DeviceBigImageList.GetBitmap(StrToInt(DeviceListView.Selected.SubItems[0])+1,DeviceImage.Picture.Bitmap);
  DeviceImage.Picture.Bitmap.Mask(clWhite);
  LabelDeviceIP.Caption:='IP: '+ActualDevice.IP;
  LabelDeviceNameID.Caption:='Name: '+ActualDevice.Name+' (ID: '+RightStr(ActualDevice.ID,Length(ActualDevice.ID)-RPos('-',ActualDevice.ID))+')';
  Application.ProcessMessages;

  if ActualDevice.PIN<>'' then
    begin
      LabelDevicePIN.Caption:='PIN: gültig';

      if ActualDevice.IP<>'' then
        begin
          sleep(50);
          Device_NetworkStatus;
          LabelDeviceSoftware.Caption:='Software: '+fsapi_Info_ImageVersion(ActualDevice.IP,ActualDevice.PIN);
          ActualDevice.Modes:=fsapi_Modes_Get(ActualDevice.IP,ActualDevice.PIN);
          ActualDevice.Mode:=fsapi_Modes_ActiveMode(ActualDevice.IP,ActualDevice.PIN);
          Device_Device_On;
          Device_Muting_On;
          Volume.Max:=fsapi_Volume_GetSteps(ActualDevice.IP,ActualDevice.PIN)-1;
          if Volume.Max=255 then
            Volume.Max:=31;
          Volume.Position:=fsapi_Volume_Get(ActualDevice.IP,ActualDevice.PIN);

          try
          sleep(200);
          ActualDevice.Equalizer.ActiveEqualizer:=fsapi_Equalizer_Get(ActualDevice.IP,ActualDevice.PIN);
          ActualDevice.Equalizer.EqualizerList:=fsapi_Equalizer_Presets_List(ActualDevice.IP,ActualDevice.PIN);
          ActualDevice.Equalizer.CustomEqualizer:=fsapi_Equalizer_Bands_List(ActualDevice.IP,ActualDevice.PIN);
          finally
          //
          end;

          //enable additional timer tasks
          IdleTimer.Enabled:=true;
        end
      else
        begin
          LabelDeviceNetwork.Caption:='Verbindungstyp: unbekannt';
          //disable additional timer tasks
          IdleTimer.Enabled:=false;
        end;
    end
  else
    begin
      ActualDevice.PIN:='';
      ControlTabSheet.Visible:=false;
      LabelDevicePIN.Caption:='PIN: ungültig (hier klicken)';
      //disable additional timer tasks
      IdleTimer.Enabled:=false;
      exit;
    end;

  Buffer:=TStringList.Create;
  Buffer.StrictDelimiter:=true;
  Buffer.Delimiter:='|';
  ModesRadioGroup.Items.Clear;
  ModesRadioGroup.Enabled:=false;
  for Index:=0 to ActualDevice.Modes.Count-1 do
    begin
      Buffer.DelimitedText:=ActualDevice.Modes.Strings[Index];
      if Buffer[1]<>'' then
        ModesRadioGroup.Items.AddStrings(Buffer[1])
      else
        ModesRadioGroup.Items.AddStrings(Buffer[2]);
    end;
  if ModesRadioGroup.Items.Count<4 then
    ModesRadioGroup.ChildSizing.EnlargeVertical:=crsAnchorAligning
  else
    ModesRadioGroup.ChildSizing.EnlargeVertical:=crsHomogenousChildResize;

  if ActualDevice.Mode>-1 then
    ModesRadioGroup.ItemIndex:=ActualDevice.Mode;

  ModesRadioGroup.Enabled:=true;
  ControlTabSheet.Visible:=true;
  ControlTabSheet.TabVisible:=true;

  Device_Presets;
  Ini_Write_Value('Settings','LastActiveDevice',ActualDevice.ID);

  Buffer.Clear;

  EqualizerRadioGroup.Items.Clear;
  EqualizerRadioGroup.Enabled:=false;
  for Index:=0 to ActualDevice.Equalizer.EqualizerList.Count-1 do
    begin
      Buffer.DelimitedText:=ActualDevice.Equalizer.EqualizerList.Strings[Index];
      if Buffer[1]<>'' then
        EqualizerRadioGroup.Items.AddStrings(Buffer[1])
      else
        EqualizerRadioGroup.Items.AddStrings('Equalizer '+IntToStr(Index));
    end;
  if EqualizerRadioGroup.Items.Count<4 then
    EqualizerRadioGroup.ChildSizing.EnlargeVertical:=crsAnchorAligning
  else
    EqualizerRadioGroup.ChildSizing.EnlargeVertical:=crsHomogenousChildResize;
  EqualizerRadioGroup.ItemIndex:=ActualDevice.Equalizer.ActiveEqualizer;
  EqualizerRadioGroup.Enabled:=true;

  if ActualDevice.Equalizer.CustomEqualizer.Count>0 then
    begin
      EqualizerGroupBox.Visible:=true;
    end
  else
    begin
      EqualizerGroupBox.Visible:=false;;
    end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
//MainForm activation
begin
  {$IFNDEF DARWIN}
  FirstStartSplashscreen;
  {$ENDIF}
end;

procedure TMainForm.DeviceOffImageClick(Sender: TObject);
//switch device on
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (DeviceOffImage.Visible=false) then
    exit;
  fsapi_Standby_On(ActualDevice.IP,ActualDevice.PIN);
  Device_Device_On;
end;

procedure TMainForm.DeviceMuteImageClick(Sender: TObject);
//switch muting off
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (DeviceMuteImage.Visible=false) then
    exit;
  fsapi_Mute_Off(ActualDevice.IP,ActualDevice.PIN);
  Device_Muting_On;
end;

procedure TMainForm.ControlButtonsPanel2Resize(Sender: TObject);
begin
  SleepTimerComboBox.Top:=StandbyButton.Height;
  SleepTimerComboBox.Width:=StandbyButton.Width;
  SleepTimerComboBox.Left:=StandbyButton.Left;
end;

procedure TMainForm.ControlFrequencyPanelResize(Sender: TObject);
begin
  ControlFrequencyPanel.Height:=FreqMinusButton.Height+LowFreqLabel.Height;
  FreqMinusButton.Left:=0;
  FreqMinusButton.Top:=0;
  {
  Frequency.Left:=FreqMinusButton.Width+4;
  Frequency.Top:=FreqMinusButton.Top;
  Frequency.Height:=FreqMinusButton.Height div 2 ;//ControlFrequencyPanel.ClientHeight div 2;
  Frequency.Width:=ControlFrequencyPanel.ClientWidth-FreqMinusButton.Width-FreqPlusButton.Width-8;
  ScaleImage.Left:=Frequency.Left;
  ScaleImage.Top:=Frequency.Height;
  ScaleImage.Height:=Frequency.Height;
  ScaleImage.Width:=Frequency.Width;
  }
  ScaleImage.Left:=FreqMinusButton.Width+4;
  ScaleImage.Top:=FreqMinusButton.Top;
  ScaleImage.Height:=FreqMinusButton.Height;
  ScaleImage.Width:=ControlFrequencyPanel.ClientWidth-FreqMinusButton.Width-FreqPlusButton.Width-8;
  Frequency.Left:=ScaleImage.Left;
  Frequency.Height:=FreqMinusButton.Height div 2;
  Frequency.Top:=ScaleImage.Top+(ScaleImage.Height-Frequency.Height) div 2;
  Frequency.Width:=ScaleImage.Width;

  FreqPlusButton.Left:=ControlFrequencyPanel.ClientWidth-FreqPlusButton.Width;
  FreqPlusButton.Top:=FreqMinusButton.Top;
  LowFreqLabel.Top:=FreqMinusButton.Height;
  LowFreqLabel.Width:=200;
  LowFreqLabel.Left:=Frequency.Left;
  HighFreqLabel.Top:=LowFreqLabel.Top;
  HighFreqLabel.Width:=LowFreqLabel.Width;
  HighFreqLabel.Left:=FreqPlusButton.Left-HighFreqLabel.Width;
  MidFreqLabel.Top:=LowFreqLabel.Top;
  MidFreqLabel.Width:=LowFreqLabel.Width;
  MidFreqLabel.Left:=Frequency.Left+(Frequency.Width div 2)-(MidFreqLabel.Width div 2);
end;

procedure TMainForm.DeviceMuteOffImageClick(Sender: TObject);
//switch muting on
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (DeviceMuteOffImage.Visible=false) then
    exit;
  fsapi_Mute_On(ActualDevice.IP,ActualDevice.PIN);
  Device_Muting_On;
end;

procedure TMainForm.DeviceOnImageClick(Sender: TObject);
//switch device off
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or (DeviceOnImage.Visible=false) then
    exit;
  fsapi_Standby_Off(ActualDevice.IP,ActualDevice.PIN);
  Device_Device_On;
end;

procedure TMainForm.DeviceListViewDblClick(Sender: TObject);
//new device selected and switch to control page
begin
  Lock_Controls;
  Application.ProcessMessages;
  Device_Selected;
  Device_Navigation;
  Application.ProcessMessages;
  if ActualDevice.PIN<>'' then
    begin
      PageControl1.ActivePageIndex:=2;
    end;
  Application.ProcessMessages;
  Unlock_Controls;
end;

procedure TMainForm.DeviceListViewResize(Sender: TObject);
begin
  if DeviceListView.ColumnCount>0 then
    DeviceListView.Columns.Items[0].Width:=DeviceListView.ClientWidth;
end;

procedure TMainForm.EqualizerGroupBoxResize(Sender: TObject);
begin
  ManualEqualizerSettingLabel1.Top:=0;
  ManualEqualizerSettingLabel1.Left:=0;
  ManualEqualizerSettingLabel1.Width:=Round(EqualizerGroupBox.ClientWidth*0.5);
  ManualEqualizerSettingLabel1.Height:=20;

  ManualEqualizerSettingLabel2.Top:=ManualEqualizerSettingLabel1.Top;
  ManualEqualizerSettingLabel2.Left:=ManualEqualizerSettingLabel1.Width;
  ManualEqualizerSettingLabel2.Width:=EqualizerGroupBox.ClientWidth-ManualEqualizerSettingLabel1.Width;
  ManualEqualizerSettingLabel2.Height:=ManualEqualizerSettingLabel1.Height;

  ManualEqualizerSettingLabel3.Top:=ManualEqualizerSettingLabel1.Height;
  ManualEqualizerSettingLabel3.Left:=ManualEqualizerSettingLabel1.Left;
  ManualEqualizerSettingLabel3.Width:=Round(EqualizerGroupBox.ClientWidth*0.15);
  ManualEqualizerSettingLabel3.Height:=30;

  ManualEqualizerSettingImage1.Top:=ManualEqualizerSettingLabel3.Top;
  ManualEqualizerSettingImage1.Left:=ManualEqualizerSettingLabel3.Width;
  ManualEqualizerSettingImage1.Height:=ManualEqualizerSettingLabel3.Height;
  ManualEqualizerSettingImage1.Width:=EqualizerGroupBox.ClientWidth-(2*ManualEqualizerSettingLabel3.Width);

  EqualizerTrackBar1.Top:=ManualEqualizerSettingImage1.Top+5;
  EqualizerTrackBar1.Left:=ManualEqualizerSettingImage1.Left;
  EqualizerTrackBar1.Width:=ManualEqualizerSettingImage1.Width;
  EqualizerTrackBar1.Height:=ManualEqualizerSettingImage1.Height-10;

  ManualEqualizerSettingLabel4.Top:=ManualEqualizerSettingLabel3.Top;
  ManualEqualizerSettingLabel4.Height:=ManualEqualizerSettingLabel3.Height;
  ManualEqualizerSettingLabel4.Width:=ManualEqualizerSettingLabel3.Width;
  ManualEqualizerSettingLabel4.Left:=ManualEqualizerSettingLabel3.Width+ManualEqualizerSettingImage1.Width;

  ManualEqualizerSettingLabel5.Top:=ManualEqualizerSettingLabel3.Top+(3*ManualEqualizerSettingLabel3.Height);
  ManualEqualizerSettingLabel5.Left:=ManualEqualizerSettingLabel1.Left;
  ManualEqualizerSettingLabel5.Width:=ManualEqualizerSettingLabel1.Width;
  ManualEqualizerSettingLabel5.Height:=ManualEqualizerSettingLabel1.Height;

  ManualEqualizerSettingLabel6.Top:=ManualEqualizerSettingLabel5.Top;
  ManualEqualizerSettingLabel6.Left:=ManualEqualizerSettingLabel5.Width;
  ManualEqualizerSettingLabel6.Width:=EqualizerGroupBox.ClientWidth-ManualEqualizerSettingLabel5.Width;
  ManualEqualizerSettingLabel6.Height:=ManualEqualizerSettingLabel5.Height;

  ManualEqualizerSettingLabel7.Top:=ManualEqualizerSettingLabel6.Top+ManualEqualizerSettingLabel6.Height;
  ManualEqualizerSettingLabel7.Left:=ManualEqualizerSettingLabel5.Left;
  ManualEqualizerSettingLabel7.Width:=Round(EqualizerGroupBox.ClientWidth*0.15);
  ManualEqualizerSettingLabel7.Height:=30;

  ManualEqualizerSettingImage2.Top:=ManualEqualizerSettingLabel7.Top;
  ManualEqualizerSettingImage2.Left:=ManualEqualizerSettingLabel7.Width;
  ManualEqualizerSettingImage2.Height:=ManualEqualizerSettingLabel7.Height;
  ManualEqualizerSettingImage2.Width:=EqualizerGroupBox.ClientWidth-(2*ManualEqualizerSettingLabel7.Width);

  EqualizerTrackBar2.Top:=ManualEqualizerSettingImage2.Top+5;
  EqualizerTrackBar2.Left:=ManualEqualizerSettingImage2.Left;
  EqualizerTrackBar2.Width:=ManualEqualizerSettingImage2.Width;
  EqualizerTrackBar2.Height:=ManualEqualizerSettingImage2.Height-10;

  ManualEqualizerSettingLabel8.Top:=ManualEqualizerSettingLabel7.Top;
  ManualEqualizerSettingLabel8.Height:=ManualEqualizerSettingLabel7.Height;
  ManualEqualizerSettingLabel8.Width:=ManualEqualizerSettingLabel7.Width;
  ManualEqualizerSettingLabel8.Left:=ManualEqualizerSettingLabel7.Width+ManualEqualizerSettingImage2.Width;
end;

procedure TMainForm.EqualizerPanelResize(Sender: TObject);
begin
  EqualizerRadioGroup.Top:=0;
  EqualizerRadioGroup.Left:=0;
  EqualizerRadioGroup.Height:=EqualizerPanel.ClientHeight;
  EqualizerRadioGroup.Width:=(EqualizerPanel.ClientWidth div 3);
  EqualizerGroupBox.Top:=EqualizerRadioGroup.Top;
  EqualizerGroupBox.Left:=EqualizerRadioGroup.Width;
  EqualizerGroupBox.Height:=EqualizerRadioGroup.Height;
  EqualizerGroupBox.Width:=EqualizerPanel.ClientWidth-EqualizerRadioGroup.Width;
end;

procedure TMainForm.EqualizerRadioGroupSelectionChanged(Sender: TObject);
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') or ((Sender as TRadioGroup).Name<>EqualizerRadioGroup.Name) or (EqualizerLocked=true) then
    exit;

  Lock_Controls;
  Application.ProcessMessages;
  if fsapi_Equalizer_Set(ActualDevice.IP,ActualDevice.PIN,EqualizerRadioGroup.ItemIndex)=true then
    ActualDevice.Equalizer.ActiveEqualizer:=EqualizerRadioGroup.ItemIndex
  else
    begin
      EqualizerRadioGroup.ItemIndex:=fsapi_Equalizer_Get(ActualDevice.IP,ActualDevice.PIN);
      ActualDevice.Equalizer.ActiveEqualizer:=EqualizerRadioGroup.ItemIndex;
    end;

  if EqualizerRadioGroup.ItemIndex=0 then
    begin
      EqualizerTrackBar1.Enabled:=true;
      EqualizerTrackBar2.Enabled:=true;
    end
  else
    begin
      EqualizerTrackBar1.Enabled:=false;
      EqualizerTrackBar2.Enabled:=false;
    end;

  Unlock_Controls;
end;

procedure TMainForm.EqualizerTrackBar1Change(Sender: TObject);
begin
  if EqualizerGroupBox.Visible=true then
    ManualEqualizerSettingLabel2.Caption:=IntToStr(EqualizerTrackBar1.Position);
end;

procedure TMainForm.EqualizerTrackBar1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Buffer: String;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  Buffer:=IntToStr(EqualizerTrackBar1.Position)+'|';
  Buffer:=Buffer+DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[0],1)+'|';
  Buffer:=Buffer+IntToStr(EqualizerTrackBar1.Min)+'|';
  Buffer:=Buffer+IntToStr(EqualizerTrackBar1.Max);
  ActualDevice.Equalizer.CustomEqualizer.Strings[0]:=Buffer;
  fsapi_Equalizer_CustomParam0_Set(ActualDevice.IP,ActualDevice.PIN,EqualizerTrackBar1.Position);
end;

procedure TMainForm.EqualizerTrackBar2Change(Sender: TObject);
begin
  if EqualizerGroupBox.Visible=true then
    ManualEqualizerSettingLabel6.Caption:=IntToStr(EqualizerTrackBar2.Position);
end;

procedure TMainForm.EqualizerTrackBar2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Buffer: String;

begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  Buffer:=IntToStr(EqualizerTrackBar2.Position)+'|';
  Buffer:=Buffer+DoSplit(ActualDevice.Equalizer.CustomEqualizer.Strings[1],1)+'|';
  Buffer:=Buffer+IntToStr(EqualizerTrackBar2.Min)+'|';
  Buffer:=Buffer+IntToStr(EqualizerTrackBar2.Max);
  ActualDevice.Equalizer.CustomEqualizer.Strings[1]:=Buffer;
  fsapi_Equalizer_CustomParam1_Set(ActualDevice.IP,ActualDevice.PIN,EqualizerTrackBar2.Position);
end;

procedure TMainForm.PresetAddButton10Click(Sender: TObject);
begin
  Preset_Add(9);
end;

procedure TMainForm.PresetAddButton1Click(Sender: TObject);
begin
  Preset_Add(0);
end;

procedure TMainForm.PresetAddButton2Click(Sender: TObject);
begin
  Preset_Add(1);
end;

procedure TMainForm.PresetAddButton3Click(Sender: TObject);
begin
  Preset_Add(2);
end;

procedure TMainForm.PresetAddButton4Click(Sender: TObject);
begin
  Preset_Add(3);
end;

procedure TMainForm.PresetAddButton5Click(Sender: TObject);
begin
  Preset_Add(4);
end;

procedure TMainForm.PresetAddButton6Click(Sender: TObject);
begin
  Preset_Add(5);
end;

procedure TMainForm.PresetAddButton7Click(Sender: TObject);
begin
  Preset_Add(6);
end;

procedure TMainForm.PresetAddButton8Click(Sender: TObject);
begin
  Preset_Add(7);
end;

procedure TMainForm.PresetAddButton9Click(Sender: TObject);
begin
  Preset_Add(8);
end;

procedure TMainForm.PresetPlayButton10Click(Sender: TObject);
begin
  Preset_Play(9);
end;

procedure TMainForm.PresetPlayButton1Click(Sender: TObject);
begin
  Preset_Play(0);
end;

procedure TMainForm.PresetPlayButton2Click(Sender: TObject);
begin
  Preset_Play(1);
end;

procedure TMainForm.PresetPlayButton3Click(Sender: TObject);
begin
  Preset_Play(2);
end;

procedure TMainForm.PresetPlayButton4Click(Sender: TObject);
begin
  Preset_Play(3);
end;

procedure TMainForm.PresetPlayButton5Click(Sender: TObject);
begin
  Preset_Play(4);
end;

procedure TMainForm.PresetPlayButton6Click(Sender: TObject);
begin
  Preset_Play(5);
end;

procedure TMainForm.PresetPlayButton7Click(Sender: TObject);
begin
  Preset_Play(6);
end;

procedure TMainForm.PresetPlayButton8Click(Sender: TObject);
begin
  Preset_Play(7);
end;

procedure TMainForm.PresetPlayButton9Click(Sender: TObject);
begin
  Preset_Play(8);
end;

procedure TMainForm.RadioPanelResize(Sender: TObject);
begin
  ControlFrequencyPanel.Top:=0;
  ControlFrequencyPanel.Left:=4;
  ControlFrequencyPanel.Width:=RadioPanel.ClientWidth-8;
  ControlFrequencyPanel.Height:=FreqMinusButton.Height+LowFreqLabel.Height;
  ControlDABPanel.Top:=0;
  ControlDABPanel.Left:=(RadioPanel.ClientWidth-ControlDABPanel.Width) div 2;
  SetPresetPanel.Top:=ControlFrequencyPanel.Height;
  SetPresetPanel.Left:=ControlFrequencyPanel.Left;
  SetPresetPanel.Width:=ControlFrequencyPanel.Width;
  SetPresetPanel.Height:=RadioPanel.ClientHeight-ControlFrequencyPanel.Height;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  Index: Integer;

begin
  //own exception handling
  Application.onException:=@onExcept;
  //Application.CaptureExceptions:=false;

  //set program title
  MainForm.Caption:=Application.Title;

  //program defaults
  PageControl1.ActivePageIndex:=1;
  MainForm.Constraints.MinHeight:=MainForm.Height;
  MainForm.Constraints.MinWidth:=MainForm.Width;
  PageControl1.Visible:=true;
  NavigationTabSheet.TabVisible:=false;
  RadioTabSheet.TabVisible:=false;
  FirstStart:=true;
  fsapi_ReUseSessionID:=true;
  Presets_Reset;
  DeviceList_Reset;
  ActualDevice.Device_On:=false;
  ModeLocked:=false;
  EqualizerLocked:=false;
  SleepTimerComboBox.Items.Clear;
  SleepTimerComboBox.Items.Add('Sleeptimer aus');
  SleepTimerComboBox.Items.Add('aus in 1 Minute');
  for Index:=2 to 120 do
    SleepTimerComboBox.Items.Add('aus in '+IntToStr(Index)+' Minuten');
  SleepTimerComboBox.ItemIndex:=0;
  SleepTimerLocked:=false;
  NotifyEnabled:=false;

  //special GUI workarounds for DARWIN target
  {$IFDEF DARWIN}
  DeviceListView.ViewStyle:=vsList;
  for Index:=0 to MainForm.DeviceInfoPanel.ControlCount-1 do
    begin
      if MainForm.DeviceInfoPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.DeviceInfoPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.PageControlPanel.ControlCount-1 do
    begin
      if MainForm.PageControlPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.PageControlPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.DeviceListPanel.ControlCount-1 do
    begin
      if MainForm.DeviceListPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.DeviceListPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.ControlVolumePanel.ControlCount-1 do
    begin
      if MainForm.ControlVolumePanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.ControlVolumePanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.ControlButtonsPanel1.ControlCount-1 do
    begin
      if MainForm.ControlButtonsPanel1.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.ControlButtonsPanel1.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.ControlButtonsPanel2.ControlCount-1 do
    begin
      if MainForm.ControlButtonsPanel2.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.ControlButtonsPanel2.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.ControlFrequencyPanel.ControlCount-1 do
    begin
      if MainForm.ControlFrequencyPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.ControlFrequencyPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.ControlDABPanel.ControlCount-1 do
    begin
      if MainForm.ControlDABPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.ControlDABPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  for Index:=0 to MainForm.SetPresetPanel.ControlCount-1 do
    begin
      if MainForm.SetPresetPanel.Controls[Index].ClassName='TSpeedButton' then
        (MainForm.SetPresetPanel.Controls[Index] as TSpeedButton).Flat:=false;
    end;
  {$ENDIF}

  //Debug
  {$IFDEF PROG_DEBUG}
  MainForm.Caption:=MainForm.Caption+' (Debug)';
  DebugTabSheet.TabVisible:=true;
  LogMemo.Visible:=true;
  fsapi_Debug_NoShowMessage:=true;
  DebugTimer.Enabled:=true;
  {$ELSE}
  DebugTimer.Enabled:=false;
  DebugTabSheet.TabVisible:=false;
  LogMemo.Visible:=false;
  {$ENDIF}
end;

procedure TMainForm.FormResize(Sender: TObject);
//Resize panels
begin
  DeviceInfoPanel.Top:=DeviceListPanel.Top;
  DeviceInfoPanel.Height:=143;
  DeviceInfoPanel.Left:=0;
  DeviceInfoPanel.Width:=MainForm.ClientWidth;

  PlayInfoPanel.Top:=DeviceInfoPanel.Height;
  PlayInfoPanel.Left:=0;
  PlayInfoPanel.Height:=DeviceInfoPanel.Height;
  PlayInfoPanel.Width:=MainForm.ClientWidth;

  PageControlPanel.Left:=0;
  PageControlPanel.Top:=DeviceInfoPanel.Height+PlayInfoPanel.Height;
  PageControlPanel.Width:=MainForm.ClientWidth;
  PageControlPanel.Height:=MainForm.ClientHeight-DeviceInfoPanel.Height-PlayInfoPanel.Height;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  {$IFDEF DARWIN}
  //special GUI workaround for DARWIN target for showing the splash screen
  MainForm.Visible:=true;
  MainForm.BringToFront;
  FirstStartSplashscreen;
  {$ENDIF}

  //Notify Thread
  NotifyThread:=TNotifyThread.Create(false);
  NotifyEnabled:=true;
end;

procedure TMainForm.FreqMinusButtonClick(Sender: TObject);
//FM scan down
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Previous(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.FreqPlusButtonClick(Sender: TObject);
//FM scan up
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  fsapi_PlayControl_Next(ActualDevice.IP,ActualDevice.PIN);
end;

procedure TMainForm.FrequencyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//set FM frequency
begin
  if (ActualDevice.IP='') or (ActualDevice.PIN='') then
    exit;
  Frequency.Position:=(Frequency.Position div ActualDevice.FM_Steps)*ActualDevice.FM_Steps;
  Device_PlayInfoClear;
  fsapi_FM_SetFrequency(ActualDevice.IP,ActualDevice.PIN,Frequency.Position+ActualDevice.FM_Min);
end;

procedure TMainForm.IdleTimerTimer(Sender: TObject);
//additional timer tasks
var
  Buffer: String;

begin
  //try to load fsapi_Info_graphicUri again if only default picture for Internet Radio
  if ActualDevice.Device_On=true then
    begin
      if (ActualDevice.ModeID<>'AUXIN') and (ActualDevice.ModeID<>'BLUETOOTH') and (ActualDevice.ModeID<>'CD') and (ActualDevice.ModeID<>'FM') then
        begin
          if LowerCase(LeftStr(PlayImageFile,5))<>'http:' then
            begin
              Buffer:=fsapi_Info_graphicUri(ActualDevice.IP,ActualDevice.PIN);
              {$IFDEF PROG_DEBUG}fsapi_Debug_Message:=fsapi_Debug_Message+#13#10+'IdleTimer -> fsapi_Info_graphicUri='+Buffer+#13#10;{$ENDIF}
              if (Buffer<>'') then
                CoverImage_Load(Buffer);
            end;
        end;
      if PlayInfoName.Caption='' then
        begin
          Buffer:=fsapi_Info_Name(ActualDevice.IP,ActualDevice.PIN);
          PlayInfoName.Caption:=Buffer;
          {$IFDEF PROG_DEBUG}fsapi_Debug_Message:=fsapi_Debug_Message+#13#10+'IdleTimer -> fsapi_Info_Name='+Buffer+#13#10;{$ENDIF}
        end;
    end;
end;

procedure TMainForm.LabelDeviceNameIDClick(Sender: TObject);
//edit device name
var
  Index: Integer;

begin
  //check for valid PIN
  if ActualDevice.PIN='' then
    exit;
  Lock_Controls;
  //show the Name form
  NameForm.NameEdit.Text:=ActualDevice.Name;
  NameForm.ShowModal;
  if NameForm.ModalResult=mrOK then
    begin
      if fsapi_Info_SetFriendlyName(ActualDevice.IP,ActualDevice.PIN,NameForm.NameEdit.Text)=true then
        begin
        ActualDevice.Name:=NameForm.NameEdit.Text;
        for Index:=0 to Length(DeviceList) do
          begin
            if DeviceList[Index].ID=ActualDevice.ID then
              begin
                DeviceList[Index].Name:=ActualDevice.Name;
                break;
              end;
          end;
        DeviceList_Show;
        Device_Selected;
        end;
    end;
  Unlock_Controls;
end;

procedure TMainForm.LabelDeviceNameIDMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ActualDevice.PIN<>'' then
    LabelDeviceNameID.Cursor:=crHandPoint;
end;

procedure TMainForm.LabelDevicePINClick(Sender: TObject);
//edit PIN
var
  Buffer: String;
  Index:  Integer;

begin
  //check if device is selected
  if DeviceListView.ItemIndex<0 then
    exit;
  //check if PIN is already available
  if DeviceList[DeviceListView.ItemIndex].PIN<>'' then
    exit;
  Lock_Controls;

  //show the PIN form
  PINForm.PINEdit.EditText:='';
  PINForm.ShowModal;

  //test if new PIN is valid
  if PINForm.PINEdit.EditText<>'' then
    begin
      Buffer:=fsapi_Info_DeviceID(ActualDevice.IP,PINForm.PINEdit.EditText);
      if Buffer<>'' then
        begin
          ActualDevice.PIN:=PINForm.PINEdit.EditText;
          for Index:=0 to Length(DeviceList) do
            begin
              if DeviceList[Index].ID=ActualDevice.ID then
                begin
                  DeviceList[Index].PIN:=ActualDevice.PIN;
                  DeviceList_Save;
                  break;
                end;
            end;
          Device_Selected;
          if ActualDevice.PIN<>'' then
            PageControl1.ActivePageIndex:=2;
        end;
    end;
  Unlock_Controls;
end;

procedure TMainForm.LabelDevicePINMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ActualDevice.PIN='' then
    LabelDevicePIN.Cursor:=crHandPoint;
end;

procedure TMainForm.LabelDeviceSoftwareClick(Sender: TObject);
//Update check
var
  UpdateInfo: String;

begin
  //check for existing PIN
  if (DeviceList[DeviceListView.ItemIndex].PIN='') or (LabelDeviceSoftware.Visible=false) then
    exit;
  Lock_Controls;
  //start update check
  UpdateInfo:=fsapi_Info_DeviceUpdateInfo(DeviceList[DeviceListView.ItemIndex].IP,DeviceList[DeviceListView.ItemIndex].PIN);
  {$IFDEF PROG_DEBUG}
  if UpdateInfo<>'' then
    Log('Update ->'+#13#10+UpdateInfo)
  else
    Log('Update -> n/a');
  {$ENDIF}
  if UpdateInfo<>'' then
    ShowMessage('Es ist ein neues Update verfügbar!')
  else
    ShowMessage('Kein Update gefunden!');
  Unlock_Controls;
end;

procedure TMainForm.LabelDeviceSoftwareMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if LabelDeviceSoftware.Caption='' then
    exit;
  LabelDeviceSoftware.Cursor:=crHandPoint;
end;

procedure TMainForm.FirstStartSplashscreen;
//show a splashscreen on the first start up
begin
  if FirstStart=true then
    begin
      MainForm.BringToFront;
      Lock_Controls;
      SplashScreenForm.SplashScreenText.Caption:=Application.Title+#13#10+'© '+STR_Date[1..4]+' Alexander Feuster'+#13#10+'https:/github.com/feuster';
      SplashScreenForm.Status.SimpleText:='Suche Geräte...';
      SplashScreenForm.Show;
      SplashScreenForm.BringToFront;
      DeviceList_Update;
      DeviceList_Show;
      SplashScreenForm.Hide;
      Unlock_Controls;
    end;
  FirstStart:=false;
  NotifyEnabled:=true;
end;

end.

