#tag Class
Protected Class FindReplace
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function FindInDocument(SearchPattern As String, Start As Integer = 0, Finish As Integer = - 1) As Integer
		  Dim mb As New MemoryBlock(SearchPattern.LenB)
		  mb.StringValue(0, mb.Size) = SearchPattern
		  mCurrentPattern = SearchPattern
		  
		  If Finish = -1 Then EndPosition = Me.Field.Text.Len Else EndPosition = Finish
		  StartPosition = Start
		  Return Me.SendMessage(Scintilla.SCI.SEARCHINTARGET, SearchPattern.LenB, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindInSelection(SearchPattern As String) As Integer
		  ' Sets the start and end positions to the current selection, if any
		  Dim mb As New MemoryBlock(SearchPattern.LenB)
		  mb.StringValue(0, mb.Size) = SearchPattern
		  mCurrentPattern = SearchPattern
		  Call Me.SendMessage(Scintilla.SCI.TARGETFROMSELECTION)
		  Return Me.SendMessage(Scintilla.SCI.SEARCHINTARGET, SearchPattern.LenB, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTargetText() As String
		  Return Me.Field.Text.Mid(StartPosition, EndPosition - StartPosition)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(ReplaceWith As String) As Integer
		  Dim mb As MemoryBlock = ReplaceWith
		  If Not Me.RegExMode Then
		    Return Me.SendMessage(Scintilla.SCI.REPLACETARGET, mb.Size, mb)
		  Else
		    Return Me.SendMessage(Scintilla.SCI.REPLACETARGETRE, mb.Size, mb)
		  End If
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETTARGETEND)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETTARGETEND, value, 0)
			End Set
		#tag EndSetter
		EndPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETSEARCHFLAGS)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETSEARCHFLAGS, value, 0)
			End Set
		#tag EndSetter
		Flags As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_MATCHCASE) = SCFIND_MATCHCASE
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_MATCHCASE
			  Else
			    Me.Flags = Me.Flags Or SCFIND_MATCHCASE
			    Me.Flags = Me.Flags Xor SCFIND_MATCHCASE
			  End If
			End Set
		#tag EndSetter
		MatchCase As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentPattern As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_POSIX) = SCFIND_POSIX
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_POSIX
			  Else
			    Me.Flags = Me.Flags Or SCFIND_POSIX
			    Me.Flags = Me.Flags Xor SCFIND_POSIX
			  End If
			End Set
		#tag EndSetter
		POSIXmode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_REGEXP) = SCFIND_REGEXP
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_REGEXP
			  Else
			    Me.Flags = Me.Flags Or SCFIND_REGEXP
			    Me.Flags = Me.Flags Xor SCFIND_REGEXP
			  End If
			End Set
		#tag EndSetter
		RegExMode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETTARGETSTART)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETTARGETSTART, value, 0)
			End Set
		#tag EndSetter
		StartPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_WHOLEWORD) = SCFIND_WHOLEWORD
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_WHOLEWORD
			  Else
			    Me.Flags = Me.Flags Or SCFIND_WHOLEWORD
			    Me.Flags = Me.Flags Xor SCFIND_WHOLEWORD
			  End If
			End Set
		#tag EndSetter
		WholeWord As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_WORDSTART) = SCFIND_WORDSTART
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_WORDSTART
			  Else
			    Me.Flags = Me.Flags Or SCFIND_WORDSTART
			    Me.Flags = Me.Flags Xor SCFIND_WORDSTART
			  End If
			End Set
		#tag EndSetter
		WordStart As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = SCFIND_MATCHCASE, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_POSIX, Type = Double, Dynamic = False, Default = \"&h00400000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_REGEXP, Type = Double, Dynamic = False, Default = \"&h00200000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_WHOLEWORD, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_WORDSTART, Type = Double, Dynamic = False, Default = \"&h00100000", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="EndPosition"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flags"
			Group="Behavior"
			Type="Integer"
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
			Name="MatchCase"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="POSIXmode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegExMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartPosition"
			Group="Behavior"
			Type="Integer"
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
			Name="WholeWord"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WordStart"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
