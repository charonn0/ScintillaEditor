#tag Class
Protected Class Lexer
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Colorize(StartPosition As Integer = 0, EndPosition As Integer = - 1)
		  Call Me.SendMessage(Scintilla.SCI.COLORISE, StartPosition, EndPosition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetProperty(PropName As String) As Variant
		  Dim mb As New MemoryBlock(4 * 1024)
		  Call Me.SendMessage(Scintilla.SCI.GETPROPERTY, PropName, mb)
		  Select Case Me.PropertyType(PropName)
		  Case 0 ' SC_TYPE_BOOLEAN
		    Return mb.BooleanValue(0)
		  Case 1 ' SC_TYPE_INTEGER
		    Return mb.Int32Value(0)
		  Case 2 ' SC_TYPE_STRING
		    Return mb.CString(0)
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPropertyDescription(PropName As String) As String
		  Dim mb As New MemoryBlock(4 * 1024)
		  Call Me.SendMessage(Scintilla.SCI.DESCRIBEPROPERTY, PropName, mb)
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkAsDirty(StartPosition As Integer = 0, EndPosition As Integer = - 1)
		  Call Me.SendMessage(Scintilla.SCI.CHANGELEXERSTATE, StartPosition, EndPosition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  Dim len As Integer = Me.SendMessage(Scintilla.SCI.GETLEXERLANGUAGE)
		  Dim mb As New MemoryBlock(len + 1)
		  Call Me.SendMessage(Scintilla.SCI.GETLEXERLANGUAGE, Nil, mb)
		  Return mb.CString(0).Trim
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyCount() As Integer
		  Dim mb As New MemoryBlock(4 * 1024)
		  Call Me.SendMessage(Scintilla.SCI.PROPERTYNAMES, Nil, mb)
		  Dim data As String = mb.CString(0)
		  Dim l() As String = data.Split(EndOfLine.UNIX)
		  For i As Integer = UBound(l) DownTo 0
		    If l(i).Trim = "" Then l.Remove(i)
		  Next
		  Return UBound(l) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyName(Index As Integer) As String
		  Dim mb As New MemoryBlock(4 * 1024)
		  Call Me.SendMessage(Scintilla.SCI.PROPERTYNAMES, Nil, mb)
		  Dim data As String = mb.CString(0)
		  Dim l() As String = data.Split(EndOfLine.UNIX)
		  For i As Integer = UBound(l) DownTo 0
		    If l(i).Trim = "" Then l.Remove(i)
		  Next
		  Return l(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PropertyType(Name As String) As Integer
		  Return Me.SendMessage(Scintilla.SCI.PROPERTYTYPE, Name, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropName As String, NewValue As String)
		  Call Me.SendMessage(Scintilla.SCI.SETPROPERTY, PropName, NewValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As Scintilla.LexerTypes
		  Return LexerTypes(Me.SendMessage(Scintilla.SCI.GETLEXER))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Assigns NewLexer As Scintilla.LexerTypes)
		  Dim v As Integer = Integer(NewLexer)
		  Call Me.SendMessage(Scintilla.SCI.SETLEXER, v, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Assigns NewLexer As Scintilla.Managers.Lexer)
		  Dim v As LexerTypes = NewLexer.Value
		  Call Me.SendMessage(Scintilla.SCI.SETLEXER, v, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Assigns NewLexer As String)
		  Dim mb As New MemoryBlock(NewLexer.LenB + 1)
		  mb.CString(0) = NewLexer
		  Call Me.SendMessage(Scintilla.SCI.SETLEXERLANGUAGE, Nil, mb)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
