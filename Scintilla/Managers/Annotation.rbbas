#tag Class
Protected Class Annotation
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Remove(LineNumber As Integer)
		  Call Me.SendMessage(Scintilla.SCI.ANNOTATIONSETTEXT, LineNumber, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style(LineNumber As Integer) As Scintilla.Managers.Style
		  Dim nm As Integer = Me.SendMessage(Scintilla.SCI.ANNOTATIONGETSTYLE, LineNumber)
		  Return New Scintilla.Managers.Style(Me.Field, nm)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(LineNumber As Integer, Assigns NewStyle As Scintilla.Managers.Style)
		  If Not (NewStyle.Field Is Me.Field) Then Raise New RuntimeException ' styles are instance-specific
		  Call Me.SendMessage(Scintilla.SCI.ANNOTATIONSETSTYLE, LineNumber, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(LineNumber As Integer) As String
		  Dim len As Integer = Me.SendMessage(Scintilla.SCI.ANNOTATIONGETTEXT, LineNumber)
		  Dim mb As New MemoryBlock(len + 1)
		  Call Me.SendMessage(Scintilla.SCI.ANNOTATIONGETTEXT, LineNumber, mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(LineNumber As Integer, Assigns NewTxt As String)
		  Dim mb As New MemoryBlock(NewTxt.LenB + 1)
		  mb.CString(0) = NewTxt
		  Call Me.SendMessage(Scintilla.SCI.ANNOTATIONSETTEXT, LineNumber, mb)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.ANNOTATIONGETVISIBLE, 0, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.ANNOTATIONSETVISIBLE, 1, 0)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.ANNOTATIONSETVISIBLE, 0, 0)
			  End If
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
