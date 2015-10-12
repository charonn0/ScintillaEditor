#tag Class
Protected Class Margins
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function Clickable(MarginNumber As Integer) As Boolean
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Return Me.SendMessage(Scintilla.SCI.GETMARGINSENSITIVEN, MarginNumber) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clickable(MarginNumber As Integer, Assigns NewBool As Boolean)
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Call Me.SendMessage(Scintilla.SCI.SETMARGINSENSITIVEN, MarginNumber, NewBool)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarkerMask(MarginNumber As Integer) As Integer
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Return Me.SendMessage(Scintilla.SCI.GETMARGINMASKN, MarginNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkerMask(MarginNumber As Integer, Assigns NewMask As Integer)
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Call Me.SendMessage(Scintilla.SCI.GETMARGINMASKN, MarginNumber, NewMask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style(LineNumber As Integer) As Scintilla.Managers.Style
		  Dim nm As Integer = Me.SendMessage(Scintilla.SCI.MARGINGETSTYLE, LineNumber)
		  Return New Scintilla.Managers.Style(Me.Field, nm)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(LineNumber As Integer, Assigns NewStyle As Scintilla.Managers.Style)
		  If Not (NewStyle.Field Is Me.Field) Then Raise New RuntimeException ' styles are instance-specific
		  Call Me.SendMessage(Scintilla.SCI.MARGINSETSTYLE, LineNumber, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SymbolMask(MarginNumber As Integer) As Integer
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Return Me.SendMessage(Scintilla.SCI.GETMARGINMASKN, MarginNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SymbolMask(MarginNumber As Integer, Assigns NewMask As Integer)
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Call Me.SendMessage(Scintilla.SCI.SETMARGINMASKN, MarginNumber, NewMask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(MarginNumber As Integer) As Scintilla.SC_MARGIN
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Return Scintilla.SC_MARGIN(Me.SendMessage(Scintilla.SCI.GETMARGINTYPEN, MarginNumber))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Type(MarginNumber As Integer, Assigns NewType As Scintilla.SC_MARGIN)
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Call Me.SendMessage(Scintilla.SCI.SETMARGINTYPEN, MarginNumber, NewType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(MarginNumber As Integer) As Integer
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Return Me.SendMessage(Scintilla.SCI.GETMARGINWIDTHN, MarginNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Width(MarginNumber As Integer, Assigns NewWidth As Integer)
		  If MarginNumber < 0 Or MarginNumber > 4 Then Raise New Scintilla.ScintillaException(ERR_INVALID_MARGIN_NUMBER)
		  Call Me.SendMessage(Scintilla.SCI.SETMARGINWIDTHN, MarginNumber, NewWidth)
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
