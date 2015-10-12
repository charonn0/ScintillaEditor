#tag Class
Protected Class ScintillaException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ScintillaError As Integer, IsScintillaError As Boolean = True)
		  Me.ErrorNumber = ScintillaError
		  Me.Message = "Unknown Scintilla error 0x" + Hex(ScintillaError)
		  
		  If Not IsScintillaError Then
		    Dim buffer As New MemoryBlock(2048)
		    If FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, 0, ScintillaError, 0 , Buffer, Buffer.Size, 0) <> 0 Then
		      Me.Message = Buffer.CString(0)
		    End If
		  Else
		    Select Case ScintillaError
		    Case 0
		      Me.Message = "No error."
		    Case 1
		      Me.Message = "Generic failure."
		    Case 2
		      Me.Message = "Out of memory."
		    Case 1001
		      Me.Message = "Invalid regular expression."
		    Case ERR_INVALID_STYLE_NUMBER
		      Me.Message = "Style numbers must be between 0 and 254 (inclusive)."
		    Case ERR_INVALID_MARGIN_NUMBER
		      Me.Message = "Margin numbers must be between 0 and 4 (inclusive)."
		    Case ERR_INVALID_STYLE_OWNER
		      Me.Message = "Styles are specific to each Scintilla instance and may not be shared."
		    Case ERR_BAD_MACRO_INDEX
		      Me.Message = "There is no macro record at the specified index."
		    Case ERR_BAD_MACRO_DATA
		      Me.Message = "The macro is corrupt or not a macro."
		    Case ERR_BAD_MACRO_OBJECT
		      Me.Message = "The macro contains an object that cannot be serialized."
		    Case ERR_BAD_MACRO_ACTION
		      Me.Message = "An unsupported macro action was not recorded."
		    Case ERR_MISSING_EDITOR
		      Me.Message = "The editor does not exist."
		    End Select
		  End If
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RuntimeException"
		#tag EndViewProperty
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RuntimeException"
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
