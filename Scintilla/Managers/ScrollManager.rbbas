#tag Class
Protected Class ScrollManager
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Scroll(DeltaColumns As Integer, DeltaLines As Integer)
		  Call Me.SendMessage(Scintilla.SCI.LINESCROLL, DeltaColumns, DeltaLines)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToCaret()
		  Call Me.SendMessage(Scintilla.SCI.SCROLLCARET)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToRange(PrimaryPosition As Integer, SecondaryPosition As Integer)
		  Call Me.SendMessage(Scintilla.SCI.SCROLLRANGE, SecondaryPosition, PrimaryPosition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XCaretPolicy(CaretPolicy As Integer, CaretSlop As Integer)
		  Call Me.SendMessage(Scintilla.SCI.SETXCARETPOLICY, CaretPolicy, CaretSlop)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub YCaretPolicy(CaretPolicy As Integer, CaretSlop As Integer)
		  Call Me.SendMessage(Scintilla.SCI.SETYCARETPOLICY, CaretPolicy, CaretSlop)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETHSCROLLBAR) = 1
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETHSCROLLBAR, value)
			End Set
		#tag EndSetter
		HScollbarVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETVSCROLLBAR) = 1
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETVSCROLLBAR, value)
			End Set
		#tag EndSetter
		ScollbarVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETENDATLASTLINE) = 1
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETENDATLASTLINE, value)
			End Set
		#tag EndSetter
		ScollPastEnd As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HScollbarVisible"
			Group="Behavior"
			Type="Boolean"
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
			Name="ScollbarVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScollPastEnd"
			Group="Behavior"
			Type="Boolean"
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
