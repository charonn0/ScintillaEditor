#tag Class
Protected Class Style
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h1000
		Sub Constructor(ScintillaEditor As Scintilla.Editor, StyleNumber As Integer)
		  // Calling the overridden superclass constructor.
		  If StyleNumber < 0 Or StyleNumber >= STYLE_MAX Then Raise New Scintilla.ScintillaException(ERR_INVALID_STYLE_NUMBER)
		  Super.Constructor(ScintillaEditor)
		  mStyleNumber = StyleNumber
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Field() As Scintilla.Editor
		  Return Super.Field
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StyleNumber() As Integer
		  Return mStyleNumber
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(4)
			  Dim i As Integer = Me.SendMessage(Scintilla.SCI.STYLEGETBACK, Me.StyleNumber, 0)
			  mb.Int32Value(0) = i
			  Return RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(4)
			  mb.Byte(0) = value.Red
			  mb.Byte(1) = value.Green
			  mb.Byte(2) = value.Blue
			  Call Me.SendMessage(Scintilla.SCI.STYLESETBACK, Me.StyleNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		Background As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.STYLEGETBOLD, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.STYLESETBOLD, Me.StyleNumber, 1)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.STYLESETBOLD, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.STYLEGETHOTSPOT, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.STYLESETHOTSPOT, Me.StyleNumber, 1)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.STYLESETHOTSPOT, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Hotspot As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.STYLEGETITALIC, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.STYLESETITALIC, Me.StyleNumber, 1)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.STYLESETITALIC, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mStyleNumber As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(4)
			  Dim i As Integer = Me.SendMessage(Scintilla.SCI.STYLEGETFORE, Me.StyleNumber, 0)
			  mb.ColorValue(0, 32) = Color(i)
			  Return mb.ColorValue(0, 32)
			  'RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'Call Me.SendMessage(Scintilla.SCI.STYLESETFORE, Me.StyleNumber, UInt32(value))
			  Dim mb As New MemoryBlock(4)
			  mb.Byte(0) = value.Red
			  mb.Byte(1) = value.Green
			  mb.Byte(2) = value.Blue
			  Call Me.SendMessage(Scintilla.SCI.STYLESETFORE, Me.StyleNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(128)
			  Dim p As Ptr = mb
			  Call Me.SendMessage(Scintilla.SCI.STYLEGETFONT, Me.StyleNumber, Integer(p))
			  Dim ret As String = mb.CString(0)
			  Return ret.Trim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As MemoryBlock
			  Dim p As Ptr
			  If value <> "" Then
			    mb = New MemoryBlock(value.LenB + 1)
			    mb.CString(0) = value
			    p = mb
			  End If
			  Call Me.SendMessage(Scintilla.SCI.STYLESETFONT, Me.StyleNumber, p)
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.STYLEGETSIZEFRACTIONAL, mStyleNumber, 0) / 100
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.STYLESETSIZEFRACTIONAL, mStyleNumber, value * 100 \ 1) ' e.g. a 12.5pt font = 125. Dividing by 1 converts to Integer
			End Set
		#tag EndSetter
		TextSize As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.STYLEGETUNDERLINE, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.STYLESETUNDERLINE, Me.StyleNumber, 1)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.STYLESETUNDERLINE, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = STYLE_LASTPREDEFINED, Type = Double, Dynamic = False, Default = \"39", Scope = Private
	#tag EndConstant

	#tag Constant, Name = STYLE_MAX, Type = Double, Dynamic = False, Default = \"255", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Background"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hotspot"
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
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
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
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
