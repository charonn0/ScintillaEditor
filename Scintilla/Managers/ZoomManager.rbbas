#tag Class
Protected Class ZoomManager
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Reset()
		  ZoomLevel = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ZoomIn()
		  Call Me.SendMessage(Scintilla.SCI.ZOOMIN)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ZoomOut()
		  Call Me.SendMessage(Scintilla.SCI.ZOOMOUT)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETZOOM)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' good range is -10 to +20
			  Call Me.SendMessage(Scintilla.SCI.SETZOOM, value)
			End Set
		#tag EndSetter
		ZoomLevel As Integer
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
			Name="ZoomLevel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
