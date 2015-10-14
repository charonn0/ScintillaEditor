#tag Class
Protected Class CharacterCell
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h1000
		Sub Constructor(ScintillaEditor As Scintilla.EditControl, Position As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ScintillaEditor)
		  mPosition = Position
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Position() As Integer
		  Return mPosition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style() As Scintilla.Managers.Style
		  Dim s As Integer = Me.SendMessage(Scintilla.SCI.GETSTYLEAT, mPosition, 0)
		  Return New Scintilla.Managers.Style(Me.Field, s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Managers.Style)
		  Call Me.SendMessage(Scintilla.SCI.STARTSTYLING, mPosition, &h1F) ' start styling
		  Call Me.SendMessage(Scintilla.SCI.SETSTYLING, 1, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As String
		  Dim char As Integer = Me.SendMessage(Scintilla.SCI.GETCHARAT, mPosition, 0)
		  If char > 0 Then Return Chr(char)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Assigns NewChar As String)
		  Call Me.SendMessage(Scintilla.SCI.SETTARGETSTART, mPosition)
		  Call Me.SendMessage(Scintilla.SCI.SETTARGETEND, Position + NewChar.Len)
		  Call Me.SendMessage(Scintilla.SCI.REPLACETARGET, NewChar.Len, NewChar)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mPosition As Integer
	#tag EndProperty


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
