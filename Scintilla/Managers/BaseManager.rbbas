#tag Class
Protected Class BaseManager
	#tag Method, Flags = &h0
		Sub Constructor(ScintillaEditor As Scintilla.Editor)
		  ' Keeping a reference to a BaseManager does not prevent its ScintillaEditor from being destroyed.
		  ' Generally, do not keep references to BaseManager objects; instead, use the accessor methods of
		  ' the ScintillaEditor to get a new reference.
		  mField = New WeakRef(ScintillaEditor)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Field() As Scintilla.Editor
		  If mField <> Nil And mField.Value <> Nil Then Return Scintilla.Editor(mField.Value)
		  Raise New ScintillaException(ERR_MISSING_EDITOR)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SendMessage(Msg As Integer, WParam As Variant = Nil, LParam As Variant = Nil, DirectMessage As Boolean = False) As Integer
		  Return Me.Field.Parent.SendMessage(Msg, WParam, LParam, DirectMessage)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mField As WeakRef
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
