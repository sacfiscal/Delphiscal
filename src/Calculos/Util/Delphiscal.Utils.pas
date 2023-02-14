unit Delphiscal.Utils;

interface

uses System.Math;

function RoundABNT(const AValue: Double; const Digits: TRoundToRange; const Delta: Double = 0.00001): Double;

implementation

function SimpleRoundToEX(const AValue: Extended; const ADigit: TRoundToRange = -2): Extended;
var
  LFactor: Extended;
begin
  LFactor := IntPower(10.0, ADigit);
  if AValue < 0 then
    Result := Int((AValue / LFactor) - 0.5) * LFactor
  else
    Result := Int((AValue / LFactor) + 0.5) * LFactor;
end;

function RoundABNT(const AValue: Double; const Digits: TRoundToRange; const Delta: Double): Double;
var
  LPow, LFracValue, LPowValue: Extended;
  LRestPart: Double;
  LIntCalc, LFracCalc, LLastNumber, LIntValue: Int64;
  LIsNegative: Boolean;
{$IFNDEF EXTERNALLINKER}
  LOldRM: TFPURoundingMode;
{$ELSE}
  LOldRM: TRoundingMode;
{$ENDIF}
begin
  LOldRM := GetRoundMode;
  try
    if LOldRM <> rmNearest then
      SetRoundMode(rmNearest);

    LIsNegative := (AValue < 0);
    LPow := IntPower(10, Abs(Digits));
    LPowValue := Abs(AValue) / 10;
    LIntValue := Trunc(LPowValue);
    LFracValue := Frac(LPowValue);

    LPowValue := SimpleRoundToEX(LFracValue * 10 * LPow, -9);
    LIntCalc := Trunc(LPowValue);
    LFracCalc := Trunc(Frac(LPowValue) * 100);

    if LFracCalc > 50 then
      Inc(LIntCalc)
    else if LFracCalc = 50 then
    begin
      LLastNumber := Round(Frac(LIntCalc / 10) * 10);

      if Odd(LLastNumber) then
        Inc(LIntCalc)
      else
      begin
        LRestPart := Frac(LPowValue * 10);
        if LRestPart > Delta then
          Inc(LIntCalc);
      end;
    end;

    Result := ((LIntValue * 10) + (LIntCalc / LPow));

    if LIsNegative then
      Result := -Result;
  finally
    SetRoundMode(LOldRM);
  end;
end;

end.
