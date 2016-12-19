#tag Window
Begin Window SciLexerDemo
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
   Title           =   "Scintilla Editor Demo"
   Visible         =   True
   Width           =   4.86e+2
   Begin Scintilla.EditControl EditControl1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   "&cFFFFFF"
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
      Height          =   292
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MarginTypes     =   1,0,0,0,0
      MarginWidths    =   16,16,0,0,0
      Overtype        =   False
      ReadOnly        =   False
      RecordMacro     =   ""
      Scope           =   1
      SelEnd          =   ""
      SelStart        =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!"
      TextColor       =   "&c000000"
      TextFont        =   ""
      TextSize        =   ""
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
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  If EditControl1.Dirty Then
		    Dim msg, ttl As String
		    If ActiveFile = Nil Then 
		      msg = "Save new file?"
		      ttl = "Unsaved document"
		    Else
		      msg = "Save changes?"
		      ttl = "Unsaved changes"
		    End If
		    
		    Select Case MsgBox(msg, 48 + 3, ttl)
		    Case 6 ' Yes
		      SaveDocument()
		      
		    Case 7 ' No
		      
		    Else ' Cancel
		      Return True
		      
		    End Select
		  End If
		End Function
	#tag EndEvent


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
			If EditControl1.History.CanRedo Then Call EditControl1.History.Redo
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
			If EditControl1.History.CanUndo Then Call EditControl1.History.Undo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EOLConvertToLinux() As Boolean Handles EOLConvertToLinux.Action
			EditControl1.EOL.Value(True) = EndOfLine.UNIX
			Return True
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EOLConvertToMac() As Boolean Handles EOLConvertToMac.Action
			EditControl1.EOL.Value(True) = EndOfLine.Macintosh
			Return True
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EOLConvertToWin32() As Boolean Handles EOLConvertToWin32.Action
			EditControl1.EOL.Value(True) = EndOfLine.Windows
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EOLVisibleItem() As Boolean Handles EOLVisibleItem.Action
			EditControl1.EOL.Visible = Not EditControl1.EOL.Visible
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FontMenu() As Boolean Handles FontMenu.Action
			If EditControl1.TextSelection.HasSelection Then
			Dim s As Scintilla.Managers.Style = EditControl1.Style(1)
			Call FontSelect.SelectFont(s)
			Dim selection As Scintilla.Managers.SelectionManager = EditControl1.TextSelection
			For i As Integer = 0 To selection.SelCount '- 1
			selection.MainSelection = i
			EditControl1.SetRangeStyle(selection.SelStart, selection.SelEnd, s.StyleNumber)
			Next
			
			Else
			Call MsgBox("Please select some text before changing fonts.", 48, "No text selected!")
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MacroEndItem() As Boolean Handles MacroEndItem.Action
			EditControl1.MacroStop
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MacroLoadItem() As Boolean Handles MacroLoadItem.Action
			Dim f As FolderItem = GetOpenFolderItem(FileTypes1.RBScintillaMacroFile)
			If f = Nil Then Return True
			Try
			mMacro = Scintilla.Macro.Load(f)
			Catch Err As Scintilla.ScintillaException
			MsgBox(Err.Message)
			End Try
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MacroPlayItem() As Boolean Handles MacroPlayItem.Action
			If mMacro <> Nil Then EditControl1.PlayMacro(mMacro)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MacroSaveItem() As Boolean Handles MacroSaveItem.Action
			If mMacro = Nil Then Return True
			Dim f As FolderItem = GetSaveFolderItem(FileTypes1.RBScintillaMacroFile, "NewMacro.bsm")
			If f = Nil Then Return True
			Dim data As String = mMacro.ToString(True)
			Dim bs As BinaryStream = BinaryStream.Create(f)
			bs.Write(data)
			bs.Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MacroStartItem() As Boolean Handles MacroStartItem.Action
			mMacro = New Scintilla.Macro
			EditControl1.MacroStart
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewDocumentItem() As Boolean Handles NewDocumentItem.Action
			If EditControl1.Dirty Then
			Dim msg, ttl As String
			If ActiveFile = Nil Then
			msg = "Save new file?"
			ttl = "Unsaved document"
			Else
			msg = "Save changes?"
			ttl = "Unsaved changes"
			End If
			
			Select Case MsgBox(msg, 48 + 3, ttl)
			Case 6 ' Yes
			SaveDocument()
			
			Case 7 ' No
			
			Else ' Cancel
			Return True
			
			End Select
			End If
			
			Dim document As Scintilla.Document = EditControl1.CreateDocument
			document.Text = "Hello, world!"
			EditControl1.CurrentDocument = document
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenFileMenu() As Boolean Handles OpenFileMenu.Action
			Dim f As FolderItem = GetOpenFolderItem("")
			If f <> Nil Then 
			Dim bs As BinaryStream = BinaryStream.Open(f, True)
			ActiveFile = f
			Dim doc As Scintilla.Document = EditControl1.CreateDocument
			EditControl1.CurrentDocument = doc
			doc.Text = bs.Read(bs.Length)
			bs.Close
			EditControl1.Dirty = False
			SetTitle()
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveAsMenuItem() As Boolean Handles SaveAsMenuItem.Action
			Dim f As FolderItem = GetSaveFolderItem("", "")
			If f <> Nil Then SaveDocument(f)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveFileItem() As Boolean Handles SaveFileItem.Action
			SaveDocument()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SearchItem() As Boolean Handles SearchItem.Action
			Dim w As New FindReplaceWindow
			EditControl1.Searcher.StartPosition = EditControl1.SelStart
			EditControl1.Searcher.EndPosition = EditControl1.SelEnd
			w.Find(EditControl1)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WordWrapItem() As Boolean Handles WordWrapItem.Action
			EditControl1.WrapLines = Not EditControl1.WrapLines
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub SaveDocument(SaveAs As FolderItem = Nil)
		  If SaveAs <> Nil Then ActiveFile = SaveAs
		  If ActiveFile = Nil Or ActiveFile.Directory Then ActiveFile = GetSaveFolderItem("", "")
		  Dim bs As BinaryStream = BinaryStream.Create(ActiveFile, True)
		  bs.Write(EditControl1.Text)
		  bs.Close
		  EditControl1.Dirty = False
		  SetTitle()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTitle()
		  Dim t As String = "Scintilla Editor Demo"
		  If ActiveFile <> Nil Then t = t + " - " + ActiveFile.Name Else t = t + " - Untitled.txt"
		  If EditControl1.Dirty Then t = t + "*"
		  Self.Title = t
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActiveFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ActiveStream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBookmarks() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastMacroIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMacro As Scintilla.Macro
	#tag EndProperty


#tag EndWindowCode

#tag Events EditControl1
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  base.Append(New MenuItem("Foo"))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub SavePointReached()
		  SetTitle()
		End Sub
	#tag EndEvent
	#tag Event
		Sub SavePointLeft()
		  SetTitle()
		End Sub
	#tag EndEvent
	#tag Event
		Sub MarginClicked(MarginNumber As Integer, CharPos As Integer)
		  If MarginNumber = 1 Then
		    Dim l As Integer = Me.Lines.FromPosition(CharPos)
		    If Not Me.Lines.HasMarker(l, Scintilla.SC_MARK.MARK_CIRCLE) Then
		      Dim i As Integer = Me.Lines.AddMarker(l, Scintilla.SC_MARK.MARK_CIRCLE)
		      mBookmarks.Append(i)
		    Else
		      Me.Lines.ClearMarker(l, Scintilla.SC_MARK.MARK_CIRCLE)
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Margins.Clickable(1) = True
		  Me.TextSelection.AllowMultiple = True
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  MsgBox(hitItem.Text)
		End Function
	#tag EndEvent
	#tag Event
		Sub MacroRecord(MessageID As Integer, WParam As Ptr, LParam As Ptr)
		  If mMacro <> Nil Then mMacro.Record(MessageID, WParam, LParam)
		End Sub
	#tag EndEvent
#tag EndEvents
