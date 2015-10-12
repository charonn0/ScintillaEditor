#tag Class
Protected Class PrintingManager
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub PrintRange(Start As Integer, Stop As Integer, g As Graphics)
		  Dim range As SCI_RangeToFormat
		  range.hDC = g.Handle(g.HandleTypeHDC)
		  range.hDCTarget = g.Handle(g.HandleTypeHDC)
		  Dim r As SCI_Rectangle
		  r.Top = 0
		  r.Left = 0
		  r.Bottom = g.Height
		  r.Right = g.Width
		  range.rc = r
		  range.rcPage = r
		  Dim cr As CharacterRange
		  cr.cpMin = Start
		  cr.cpMax = Stop
		  Call Me.SendMessage(Scintilla.SCI.FORMATRANGE, True, range.StringValue(TargetLittleEndian))
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ColorModes(Me.SendMessage(Scintilla.SCI.GETPRINTCOLOURMODE))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETPRINTCOLOURMODE, value)
			End Set
		#tag EndSetter
		ColorMode As Scintilla.Managers.PrintingManager.ColorModes
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETPRINTMAGNIFICATION)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETPRINTMAGNIFICATION, value)
			End Set
		#tag EndSetter
		Magnification As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return WrapModes(Me.SendMessage(Scintilla.SCI.GETPRINTWRAPMODE))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETPRINTWRAPMODE, value)
			End Set
		#tag EndSetter
		WrapMode As Scintilla.Managers.PrintingManager.WrapModes
	#tag EndComputedProperty


	#tag Structure, Name = Sci_RangeToFormat, Flags = &h21
		hDC As Integer
		  hDCTarget As Integer
		  rc As Sci_Rectangle
		  rcPage As Sci_Rectangle
		chrg As CharacterRange
	#tag EndStructure

	#tag Structure, Name = Sci_Rectangle, Flags = &h21
		Left As Integer
		  Top As Integer
		  Right As Integer
		Bottom As Integer
	#tag EndStructure


	#tag Enum, Name = ColorModes, Type = Integer, Flags = &h0
		Normal=0
		  InvertLight
		  BlackOnWhite
		  ColorOnWhite
		ColorOnWhiteDefaultBG
	#tag EndEnum

	#tag Enum, Name = WrapModes, Type = Integer, Flags = &h0
		None=0
		  Word
		Character
	#tag EndEnum


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
			Name="Magnification"
			Group="Behavior"
			Type="Integer"
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
