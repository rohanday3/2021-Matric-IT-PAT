unit DAMessageBox;

interface

uses
  System.SysUtils,
  System.IOUtils,
  FMX.Dialogs,
  System.UITypes,
{$IFDEF MSWINDOWS}
  Winapi.ShellAPI, Winapi.Windows, Vcl.Forms;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  Macapi.CocoaTypes, Macapi.Foundation, Macapi.AppKit,
  Posix.Stdlib;
{$ENDIF POSIX}

type
  TDAMessageBox = class
    class function MessageDialog(const Title: String; const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint) : integer;
  end;

implementation


class function TDAMessageBox.MessageDialog(const Title: String; const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Integer): integer;
var
{$IFDEF MSWINDOWS}
  WinButtons : Cardinal;
  WinType : Cardinal;
{$ENDIF WINDOWS}
{$IFDEF POSIX}
  Alert: NSAlert;
  Style: NSAlertStyle;
  DlgRes : Integer;
{$ENDIF POSIX}
begin
{$IFDEF MSWINDOWS}
  case DlgType of
    TMsgDlgType.mtWarning: WinType:= MB_ICONWARNING;
    TMsgDlgType.mtError: WinType:= MB_ICONSTOP;
    TMsgDlgType.mtInformation: WinType:= MB_ICONINFORMATION;
    TMsgDlgType.mtConfirmation: WinType:= MB_ICONQUESTION;
    TMsgDlgType.mtCustom: WinType:= MB_ICONINFORMATION;
  end;

  if Buttons = mbOKCancel then begin
    WinButtons:= MB_OKCANCEL;
  end;

  if Buttons = mbYesNo then begin
    WinButtons:= MB_YESNO;
  end;

  if Buttons = mbYesNoCancel then begin
    WinButtons:= MB_YESNOCANCEL;
  end;

  Result:= MessageBox(Application.Handle, PChar(Msg), PChar(Title), WinType or WinButtons);
{$ENDIF MSWINDOWS}

{$IFDEF POSIX}
  Alert:= TNSAlert.Create;
  //map the configurations:
  //mtWarning, mtError, mtInformation, mtConfirmation

  case DlgType of
    TMsgDlgType.mtWarning: Style:= NSWarningAlertStyle;
    TMsgDlgType.mtError: Style:= NSCriticalAlertStyle;
    TMsgDlgType.mtInformation: Style:= NSInformationalAlertStyle;
    TMsgDlgType.mtConfirmation: Style:= NSInformationalAlertStyle;
    TMsgDlgType.mtCustom: Style:= NSInformationalAlertStyle;
  end;

  try
    Alert.setMessageText(NSSTR(Title));
    Alert.setInformativeText(NSSTR(Msg));
    Alert.setAlertStyle(Style);

    //add dialog buttons, note: there are only 3 buttons allowed:
    //mbAbortIgnore, mbAbortRetryIgnore, *mbOKCancel,mbYesAllNoAllCancel, mbYesAllNoAllCancel, *mbYesNo, *mbYesNoCancel
    //currently I only map the ones I need here

    if Buttons = mbOKCancel then begin
      //Writeln('mbOKCancel');
      Alert.addButtonWithTitle(NSSTR('OK'));
      Alert.addButtonWithTitle(NSSTR('Cancel'));
    end;

    if Buttons = mbYesNo then begin
      //Writeln('mbYesNo');
      Alert.addButtonWithTitle(NSSTR('Yes'));
      Alert.addButtonWithTitle(NSSTR('No'));
    end;

    if Buttons = mbYesNoCancel then begin
      //Writeln('mbYesNoCancel');
      Alert.addButtonWithTitle(NSSTR('Yes'));
      Alert.addButtonWithTitle(NSSTR('No'));
      Alert.addButtonWithTitle(NSSTR('Cancel'));
    end;

    DlgRes := Alert.runModal;

    //map the result to Delphi Consts
    //NSAlertFirstButtonReturn  = 1000,
    //NSAlertSecondButtonReturn  = 1001,
    //NSAlertThirdButtonReturn  = 1002

    if Buttons = mbOKCancel then begin
      if DlgRes = NSAlertFirstButtonReturn then Result := idYes;
      if DlgRes = NSAlertSecondButtonReturn then Result := idNo;
    end;

    if (Buttons = mbYesNo) or (Buttons = mbYesNoCancel)  then begin
      if DlgRes = NSAlertFirstButtonReturn then Result := idYes;
      if DlgRes = NSAlertSecondButtonReturn then Result := idNo;
      if DlgRes = NSAlertThirdButtonReturn then Result := idCancel;
    end;

  finally
    Alert.release;
  end;

{$ENDIF POSIX}

end;

end.
