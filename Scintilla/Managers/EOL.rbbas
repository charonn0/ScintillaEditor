#tag Class
Protected Class EOL
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function Value() As String
		  Select Case Me.SendMessage(Scintilla.SCI.GETEOLMODE)
		  Case 0
		    Return EndOfLine.Windows
		  Case 1
		    Return EndOfLine.Macintosh
		  Case 2
		    Return EndOfLine.UNIX
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(ConvertLineEndings As Boolean = True, Assigns NewEOL As String)
		  Dim m As Integer
		  Select Case NewEOL
		  Case EndOfLine.Windows
		    m = 0
		  Case EndOfLine.Macintosh
		    m = 1
		  Case EndOfLine.UNIX
		    m = 2
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		  If ConvertLineEndings Then Call Me.SendMessage(Scintilla.SCI.CONVERTEOLS, m)
		  Call Me.SendMessage(Scintilla.SCI.SETEOLMODE, m)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETVIEWEOL) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETVIEWEOL, value)
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
