#tag Class
Protected Class KeyBindings
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function Create(Key As String, Modifiers() As Integer, ScintillaCmd As Integer) As Integer
		  ' This packs the parameters into a Scintilla-style key definition and assigns it as
		  ' a new key binding for ScintillaCmd. Pass the return value to KeyBindings.Delete to
		  ' remove a previously assigned binding. See: http://www.scintilla.org/ScintillaDoc.html#Scintilla.SCI.ASSIGNCMDKEY
		  ' Modifiers are the Scintilla.SCK_* constants
		  ' ScintillaCmd is a Scintilla.Scintilla.SCI.* constant, one of those listed here: http://www.scintilla.org/ScintillaDoc.html#KeyboardCommands
		  
		  Dim KeyID As Integer = Asc(Key)
		  Dim modify As Integer
		  For Each m As Integer In Modifiers
		    modify = modify Or m
		  Next
		  KeyID = KeyID Or ShiftLeft(modify, 16)
		  Call Me.SendMessage(Scintilla.SCI.ASSIGNCMDKEY, KeyID, ScintillaCmd)
		  Return KeyID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(KeyID As Integer)
		  Call Me.SendMessage(Scintilla.SCI.CLEARCMDKEY, KeyID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAll()
		  Call Me.SendMessage(Scintilla.SCI.CLEARALLCMDKEYS)
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
