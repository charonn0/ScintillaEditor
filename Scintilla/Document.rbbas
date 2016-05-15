#tag Class
Protected Class Document
	#tag Method, Flags = &h0
		Sub Constructor(InitialOwner As Scintilla.Editor)
		  Dim doc As Integer = InitialOwner.SendMessage(Scintilla.SCI.CREATEDOCUMENT, Nil, Nil)
		  If doc <> 0 Then
		    mDocument = Ptr(doc)
		    mOwner = InitialOwner
		  Else
		    Raise New NilObjectException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialOwner As Scintilla.Editor, DocumentRef As Ptr)
		  If InitialOwner = Nil Then Raise New NilObjectException
		  If DocumentRef = Nil Then Raise New NilObjectException
		  mOwner = InitialOwner
		  Dim err As Integer = mOwner.SendMessage(Scintilla.SCI.ADDREFDOCUMENT, Nil, DocumentRef)
		  If err = 0 Then
		    mDocument = DocumentRef
		  Else
		    Dim error As New NilObjectException
		    error.ErrorNumber = err
		    Raise error
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(AdditionalOwner As Scintilla.Editor, DocumentRef As Scintilla.Document)
		  If AdditionalOwner = Nil Then Raise New NilObjectException
		  If DocumentRef = Nil Then Raise New NilObjectException
		  mOwner = AdditionalOwner
		  Dim doc As Integer = mOwner.SendMessage(Scintilla.SCI.ADDREFDOCUMENT, Nil, DocumentRef.Handle)
		  If doc <> 0 Then
		    mDocument = Ptr(doc)
		  Else
		    Raise New Scintilla.ScintillaException(mOwner.LastError)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Call mOwner.SendMessage(Scintilla.SCI.RELEASEDOCUMENT, Nil, mDocument)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mDocument
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Owner() As Scintilla.Editor
		  Return mOwner
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceLineEndings(EOL As EndOfLine)
		  Dim m As Integer
		  Select Case EOL
		  Case EndOfLine.Windows
		    m = 0
		  Case EndOfLine.Macintosh
		    m = 1
		  Case EndOfLine.UNIX
		    m = 2
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		  Call mOwner.SendMessage(Scintilla.SCI.CONVERTEOLS, Ptr(m), Nil)
		  Me.EOL = EOL
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOwner.SendMessage(Scintilla.SCI.GETMODIFY, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value And DebugBuild Then Raise New RuntimeException ' Can only be set to False
			  Call mOwner.SendMessage(Scintilla.SCI.SETSAVEPOINT, Nil, Nil)
			End Set
		#tag EndSetter
		Dirty As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Select Case mOwner.SendMessage(Scintilla.SCI.GETEOLMODE, Nil, Nil)
			  Case 0
			    Return EndOfLine.Windows
			  Case 1
			    Return EndOfLine.Macintosh
			  Case 2
			    Return EndOfLine.UNIX
			  Else
			    Raise New UnsupportedFormatException
			  End Select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim m As Integer
			  Select Case value
			  Case EndOfLine.Windows
			    m = 0
			  Case EndOfLine.Macintosh
			    m = 1
			  Case EndOfLine.UNIX
			    m = 2
			  Else
			    Raise New UnsupportedFormatException
			  End Select
			  Call mOwner.SendMessage(Scintilla.SCI.SETEOLMODE, Ptr(m), Nil)
			End Set
		#tag EndSetter
		EOL As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mDocument As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mOwner As Scintilla.Editor
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = mOwner.SendMessage(Scintilla.SCI.GETLENGTH, Nil, Nil)
			  If len > 0 Then
			    Dim mb As New MemoryBlock(len * 2)
			    len = mOwner.SendMessage(Scintilla.SCI.GETTEXT, Ptr(mb.Size), mb, True) ' send a direct message since the text might be huge
			    Dim ret As String = mb.CString(0)
			    Return ret
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As MemoryBlock = value
			  Call mOwner.SendMessage(Scintilla.SCI.SETTEXT, Nil, mb, True) ' send a direct message since the value might be huge
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Dirty"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
