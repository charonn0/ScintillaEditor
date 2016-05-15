#tag Window
Begin Window FontSelect
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.02e+2
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Select font"
   Visible         =   True
   Width           =   3.52e+2
   Begin Listbox FontList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   164
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   172
      _ScrollWidth    =   -1
   End
   Begin PushButton OKButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   177
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   171
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton CancelButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   95
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   171
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox ComboBox1
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   ""
      Left            =   258
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   94
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   177
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Size:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   69
   End
   Begin CheckBox BoldBox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Bold"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   183
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   34
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   51
   End
   Begin CheckBox ItalicBox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Italic"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   237
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   34
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   49
   End
   Begin CheckBox UnderlineBox
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Underline"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   183
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   55
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   103
   End
   Begin Canvas Preview
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   72
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   177
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   87
      UseFocusRing    =   True
      Visible         =   True
      Width           =   169
   End
   Begin Oval ColorSelect
      AutoDeactivate  =   True
      BorderColor     =   &h000000
      BorderWidth     =   1
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   314
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      Top             =   34
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function SelectFont(ByRef StyleRef As Scintilla.Managers.Style) As Boolean
		  mBold = StyleRef.Bold
		  mItalic = StyleRef.Italic
		  mUnderline = StyleRef.Underline
		  mFontName = StyleRef.TextFont
		  mFontSize = StyleRef.TextSize
		  mFontColor = StyleRef.TextColor
		  mFontBack = StyleRef.Background
		  mStyleRef = StyleRef
		  Me.ShowModal
		  Return mChanged
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFont()
		  Dim txt As String = "The quick, brown fox jumped over the lazy dog."
		  mPreview = New Picture(Preview.Width, Preview.Height, 32)
		  Dim g As Graphics = mPreview.Graphics
		  g.TextFont = mFontName
		  g.TextSize = mFontSize
		  g.ForeColor = mFontColor
		  g.Italic = mItalic
		  g.Bold = mBold
		  g.Underline = mUnderline
		  
		  Dim w, h As Double
		  w = g.StringWidth(txt)
		  h = g.StringHeight(txt, mPreview.Width - 6)
		  w = mPreview.Width - w
		  h = mPreview.Height - h
		  g.DrawString(txt, w / 2, h / 2)
		  Preview.Invalidate(False)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mBold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFontBack As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFontColor As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFontName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFontSize As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mItalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPreview As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStyleRef As Scintilla.Managers.Style
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUnderline As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events FontList
	#tag Event
		Sub Change()
		  If Me.ListIndex <> 0 Then
		    mFontName = Me.Text
		    SetFont()
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AddRow("Font")
		  Me.ListIndex = 0
		  Static fonts() As String
		  If UBound(fonts) = -1 Then
		    For i As Integer = 1 To FontCount - 1
		      Dim textfont As String = Font(i)
		      If Left(textfont, 1) <> "@" Then
		        fonts.Append(textfont)
		      End If
		    Next
		    fonts.Sort
		  End If
		  For i As Integer = 0 To fonts.Ubound
		    Me.AddRow(fonts(i))
		    Me.InvalidateCell(Me.LastIndex, 0)
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If Me.ListIndex <> 0 Then
		    Dim nm As String = Me.Cell(row, 0)
		    g.TextFont = nm
		    g.DrawString(nm, x, y)
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events OKButton
	#tag Event
		Sub Action()
		  mStyleRef.Bold = mBold
		  mStyleRef.Italic = mItalic
		  mStyleRef.Underline = mUnderline
		  mStyleRef.TextFont = mFontName
		  mStyleRef.TextSize = mFontSize
		  mStyleRef.TextColor = mFontColor
		  mStyleRef.Background = mFontBack
		  mChanged = True
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ComboBox1
	#tag Event
		Sub Open()
		  For i As Integer = 8 To 75
		    Me.AddRow(Str(i))
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex <> 0 Then
		    mFontSize = Val(Me.Text)
		    SetFont()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BoldBox
	#tag Event
		Sub Action()
		  mBold = Me.Value
		  SetFont()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ItalicBox
	#tag Event
		Sub Action()
		  mItalic = Me.Value
		  SetFont()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UnderlineBox
	#tag Event
		Sub Action()
		  mUnderline = Me.Value
		  SetFont()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Preview
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawPicture(mPreview, 0, 0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorSelect
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim p As New REALbasic.Point(X, Y)
		  Dim r As New REALbasic.Rect(Me.Left, Me.Top, Me.Width, Me.Height)
		  If r.Contains(p) Then
		    Dim c As Color = mFontColor
		    If SelectColor(c, "Select text color") Then
		      mFontColor = c
		      SetFont()
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
