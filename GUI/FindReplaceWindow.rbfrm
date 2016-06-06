#tag Window
Begin Window FindReplaceWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.22e+2
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Find & Replace"
   Visible         =   True
   Width           =   3.84e+2
   Begin TextField SearchPattern
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   68
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   309
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
      Left            =   8
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Find:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   9
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin TextField ReplacePattern
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   68
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   309
   End
   Begin Label Label2
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
      Left            =   8
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Replace:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   34
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin PushButton FindNext
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Find Next"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   284
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   94
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton FindPrev
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Find Prev"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   202
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -63
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton Replace
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Replace"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   202
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   94
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox MatchCase
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Match case"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox UseRegex
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "RegEx"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   66
   End
   Begin CheckBox WholeWord
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Whole word"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   182
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton ReplaceAll
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Replace all"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   121
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   94
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "CLose"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -63
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Find(Editor As Scintilla.EditControl, InitialPattern As String = "", InitialReplacement As String = "")
		  mEditor = Editor
		  SearchPattern.Text = InitialPattern
		  ReplacePattern.Text = InitialReplacement
		  Me.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mEditor As Scintilla.EditControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastSearchPos As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events FindNext
	#tag Event
		Sub Action()
		  Dim i As Integer = mEditor.Searcher.FindInDocument(SearchPattern.Text, mLastSearchPos)
		  If i > -1 Then
		    mEditor.TextSelection.Caret = i
		    mEditor.TextSelection.Anchor = i + SearchPattern.Text.Len
		    mEditor.ScrollPosition.ScrollToCaret
		    mLastSearchPos = i + SearchPattern.Text.Len
		  Else
		    mEditor.Searcher.StartPosition = 0
		    mEditor.Searcher.EndPosition = -1
		    mLastSearchPos = 0
		    MsgBox("Pattern not found.")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FindPrev
	#tag Event
		Sub Action()
		  'Dim i As Integer = mEditor.Searcher.FindPrev(SearchPattern.Text, mLastSearchPos)
		  'If i > -1 Then
		  'mEditor.TextSelection.Caret = i
		  'mEditor.TextSelection.Anchor = i + SearchPattern.Text.Len
		  'mLastSearchPos = i
		  'Else
		  'MsgBox("Pattern not found.")
		  'End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Replace
	#tag Event
		Sub Action()
		  Dim i As Integer = mEditor.Searcher.Replace(ReplacePattern.Text)
		  If i > -1 Then
		    mEditor.TextSelection.Caret = i
		    mEditor.TextSelection.Anchor = i + ReplacePattern.Text.Len
		  Else
		    MsgBox("Pattern not found.")
		    mEditor.Searcher.StartPosition = 0
		    mEditor.Searcher.EndPosition = -1
		    mLastSearchPos = 0
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MatchCase
	#tag Event
		Sub Action()
		  mEditor.Searcher.MatchCase = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UseRegex
	#tag Event
		Sub Action()
		  mEditor.Searcher.RegExMode = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WholeWord
	#tag Event
		Sub Action()
		  mEditor.Searcher.WholeWord = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReplaceAll
	#tag Event
		Sub Action()
		  If SearchPattern.Text = "" Then Return
		  Dim i As Integer
		  mEditor.Searcher.StartPosition = 0
		  mEditor.Searcher.EndPosition = -1
		  Do
		    i = mEditor.Searcher.FindInDocument(SearchPattern.Text, mLastSearchPos)
		    If i > -1 Then
		      mEditor.TextSelection.Caret = i
		      mEditor.TextSelection.Anchor = i + SearchPattern.Text.Len
		      mLastSearchPos = i + SearchPattern.Text.Len
		      i = mEditor.Searcher.Replace(ReplacePattern.Text)
		      If i > -1 Then
		        mEditor.TextSelection.Caret = i
		        mEditor.TextSelection.Anchor = i + ReplacePattern.Text.Len
		      End If
		    End If
		  Loop Until i < 0
		  
		  mEditor.Searcher.StartPosition = 0
		  mEditor.Searcher.EndPosition = -1
		  mLastSearchPos = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
