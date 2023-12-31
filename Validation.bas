﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Public Sub IsEmail(EmailAddress As String) As Boolean
  
	Dim MatchEmail As Matcher = Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$", EmailAddress)

	If MatchEmail.Find = True Then
		Return True
	Else
		Return False
	End If
	
End Sub

Sub IsUrl(Url As String) As Boolean
	
	Dim pattern As String = "http(s)?://([\w+?\.\w+])+([a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,]*)?"
	If Regex.IsMatch(pattern, Url) = True Then
		Return True
	Else
		Return False
	End If
	
End Sub

Public Sub IsPostalCode(Code As String) As Boolean
	
	Try
		Return Regex.IsMatch("^[0-9]{2,10}$",Code)
	Catch
		Return False
	End Try
	
End Sub

Public Sub IsJson(Str As String) As Boolean
	
	If Str.StartsWith("{") Or Str.StartsWith("[") Then
		Return True
	Else
		Return False
	End If
	
End Sub

Public Sub IsIP(IP As String) As Boolean
	
	If Regex.IsMatch("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}",IP) Then
		Return True
	Else
		Return False
	End If
	
End Sub

'validate without first zero
'function remove first zero and proccess
Public Sub IsMobileNumber(Input As String) As Boolean
	
	Dim ph As String
	ph = Input
	If ph.StartsWith("0") Then
		ph = ph.SubString(1)
	End If
	
	Try
		Return Regex.IsMatch("^\d{10,16}$",ph)
	Catch
		Return False
	End Try
End Sub

' verify input of two textboxes
Sub IsSame(ValueToCheck As String, ValueToCheck2 As String) As Boolean
	ValueToCheck = ValueToCheck.Trim
	ValueToCheck2 = ValueToCheck2.Trim
	If ValueToCheck = ValueToCheck2 Then
		Return True
	Else
		Return False
	End If
End Sub

Sub IsBlank(ValueToCheck As String) As Boolean
	ValueToCheck = ValueToCheck.Trim
	If ValueToCheck.Length = 0 Then
		Return True
	Else
		Return False
	End If
End Sub

Sub DoNotMatch(ValueToCheck As String, ValueToCheck2 As String) As Boolean
	ValueToCheck = ValueToCheck.Trim
	ValueToCheck2 = ValueToCheck2.Trim
	If ValueToCheck <> ValueToCheck2 Then
		Return True
	Else
		Return False
	End If
End Sub

Public Sub IsArray(Var As Object) As Boolean
	Dim VarType As String = GetType(Var)
	Return VarType.StartsWith("[")
End Sub

Public Sub ArrayType(Var As Object) As String
	Dim Res As String

	Dim VarType As String = GetType(Var)

	If VarType.StartsWith("[") Then

		Dim SecondChar As String = VarType.SubString2(1,2)
		Select Case SecondChar
			Case "B"
				Res = "Byte"
			Case "S"
				Res = "Short"
			Case "I"
				Res = "Int"
			Case "J"
				Res = "Long"
			Case "F"
				Res = "Float"
			Case "D"
				Res = "Double"
			Case "C"
				Res = "Char"
			Case "L"
				If VarType.Contains("String") Then
					Res = "String"
				Else
					Res = "Object"
				End If
			Case Else
				Res = ""
		End Select

	End If

	Return Res

End Sub

Public Sub IsLocation(Location As String) As Boolean
	Return Regex.IsMatch("^-?\d+(\.\d+)?+,-?\d+(\.\d+)?+$",Location)
End Sub

Public Sub IsNationalID(ID As String) As Boolean
	Return Regex.IsMatch("^\d{9,14}$",ID)
End Sub

Public Sub IsNumbers(Data As String) As Boolean
	Return IsNumber(Data)
End Sub

Public Sub IsDate(Date As String) As Boolean
	Return Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2}",Date)
End Sub

Public Sub IsDateTime(sDateTime As String) As Boolean
	Return Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}",sDateTime)
End Sub

#if location
Public Sub ParseLocation(Location As String) As LatLng
	
	If Location.IndexOf(",") > -1 Then
		
		Dim loc() As String
		loc	=	Regex.Split(",",Location.Replace(" ",""))
		
		If IsNumber(loc(0)) And IsNumber(loc(1)) Then
			Dim lt As LatLng
			lt.Initialize(loc(0),loc(1))
			
			Return lt
		Else
			Return Null
		End If
		
	End If
	
	Return Null
	
End Sub
#End If

Public Sub IsNull(Data As Object) As Boolean
	
	Dim sType As String
	Try
		sType	=	GetType(Data)
	Catch
		Return True
	End Try
	
	If sType.ToLowerCase = "null" Then
		Return True
	End If
	
	Return False
	
End Sub

Public Sub IsBoolean(Data As Object) As Boolean
	
	Dim rs As String
	rs	=	Data
	rs	=	rs.ToLowerCase
	
	If rs = "true" Or rs = "false" Then
		Return True
	Else
		Return False	
	End If
	
End Sub

Public Sub IsMap(Data As Object) As Boolean
	
	If GetType(Data) = "anywheresoftware.b4a.objects.collections.Map$MyMap" Then
		Return True
	Else
		Return False
	End If
	
End Sub

Public Sub IsList(Data As Object) As Boolean
	
	If GetType(Data) = "java.util.ArrayList" Then
		Return True
	Else
		Return False
	End If
	
End Sub

' Checks if a view is an Activity
Sub IsActivity(v As View) As Boolean
    Try
        v.Left = 10dip
        Return False
    Catch
        Return True
    End Try
End Sub

Sub ParseInt(Str As String) As Int
	Dim int2 As Int
	int2 = Str
	Return int2
End Sub

Sub ParseBoolean(Number As String) As Boolean
	
	If Number	=	"1" Then
		Return True
	
	Else if Number = "0" Then
		Return False
		
	Else
		Return False
		
	End If
	
End Sub

Sub ParsePhoneNumber(Number As String) As String
	
	Dim result As String
	
	If Number.StartsWith("+") Then
		
		Dim res() As String
		res	=	Regex.Split(" ",Number)
		
		If res.Length = 0 Then
			Return Number
		End If
		
		If res.Length = 1 Then
			Return Number
		End If
		
		Dim temp As String
		For i = 1 To res.Length - 1
			temp = temp & res(i)
		Next
		
		result	=	temp
	
	Else if Number.StartsWith("0") Then
		result	=	Number.SubString(1)
		result	=	result.Replace(" ","")
	
	Else
		result	=	Number.Replace(" ","")
	End If
	
	Return result
	
End Sub
