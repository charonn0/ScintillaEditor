#tag Window
Begin Window Window1
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.24e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   956678143
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   4.86e+2
   Begin Scintilla.EditControl EditControl1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      CaptureMouse    =   True
      CaretPosition   =   ""
      CurrentLine     =   ""
      Dirty           =   ""
      DoubleBuffer    =   True
      DoubleBuffered  =   True
      Enabled         =   True
      EOLVisible      =   True
      EraseBackground =   True
      Height          =   324
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Overtype        =   False
      ReadOnly        =   False
      Scope           =   1
      SelEnd          =   ""
      SelStart        =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!"
      Top             =   0
      UseFocusRing    =   True
      UsePopup        =   True
      Visible         =   True
      Width           =   486
      WrapLines       =   True
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			EditControl1.Text = ""
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCopy() As Boolean Handles EditCopy.Action
			If EditControl1.Clipboard.CanCopy Then EditControl1.Clipboard.Copy
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCut() As Boolean Handles EditCut.Action
			If EditControl1.Clipboard.CanCopy Then EditControl1.Clipboard.Cut()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
			If EditControl1.Clipboard.CanPaste Then EditControl1.Clipboard.Paste
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
			If EditControl1.History.CanUndo Then Call EditControl1.History.Undo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
			EditControl1.SelectAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
			If EditControl1.History.CanRedo Then Call EditControl1.History.Redo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewDocumentItem() As Boolean Handles NewDocumentItem.Action
			'Dim document As New Scintilla.Document(EditControl1.Active
			'Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events EditControl1
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append(New MenuItem("Foo"))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Break
		End Function
	#tag EndEvent
	#tag Event
		Sub MarginClicked(MarginNumber As Integer, CharPos As Integer)
		  Break
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  'Me.Margins.Width(1) = 25
		  'Me.Margins.SymbolMask(1) = Integer(Scintilla.SC_MARK.MARK_CIRCLE)
		  'Me.Margins.Clickable(1) = True
		  'Me.Margins.Width(2) = 25
		  ''Me.Margins.Clickable(2) = True
		  'Me.Margins.Type(2) = 1
		End Sub
	#tag EndEvent
#tag EndEvents
