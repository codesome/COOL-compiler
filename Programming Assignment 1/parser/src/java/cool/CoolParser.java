// Generated from CoolParser.g4 by ANTLR 4.5
package cool;

	import java.util.List;

import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CoolParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.5", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		ERROR=1, TYPEID=2, OBJECTID=3, BOOL_CONST=4, INT_CONST=5, STR_CONST=6, 
		LPAREN=7, RPAREN=8, COLON=9, ATSYM=10, SEMICOLON=11, COMMA=12, PLUS=13, 
		MINUS=14, STAR=15, SLASH=16, TILDE=17, LT=18, EQUALS=19, LBRACE=20, RBRACE=21, 
		DOT=22, DARROW=23, LE=24, ASSIGN=25, CLASS=26, ELSE=27, FI=28, IF=29, 
		IN=30, INHERITS=31, LET=32, LOOP=33, POOL=34, THEN=35, WHILE=36, CASE=37, 
		ESAC=38, OF=39, NEW=40, ISVOID=41, NOT=42, WS=43, THEEND=44, SINGLE_COMMENT=45, 
		COMMENT_CLOSE=46, CLOSED=47, COM_EOF=48, NEWLINE=49, ESC=50, ESC_NULL=51, 
		STR_EOF=52, ERR1=53, ERR2=54, ERR3=55, LQUOTE=56, NL=57, TAB=58, BACKSPAC=59, 
		LINEFEED=60, SLASHN=61, ESC_NL=62;
	public static final int
		RULE_program = 0, RULE_class_list = 1, RULE_class_ = 2, RULE_feature = 3, 
		RULE_formal = 4, RULE_expr = 5;
	public static final String[] ruleNames = {
		"program", "class_list", "class_", "feature", "formal", "expr"
	};

	private static final String[] _LITERAL_NAMES = {
		null, null, null, null, null, null, null, "'('", "')'", "':'", "'@'", 
		"';'", "','", "'+'", "'-'", "'*'", "'/'", "'~'", "'<'", "'='", "'{'", 
		"'}'", "'.'", "'=>'", "'<='", "'<-'", null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, "'*)'", null, null, null, null, null, null, null, null, null, 
		null, null, "'\\t'", "'\\b'", "'\\f'", "'\\n'", "'\\\n'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "ERROR", "TYPEID", "OBJECTID", "BOOL_CONST", "INT_CONST", "STR_CONST", 
		"LPAREN", "RPAREN", "COLON", "ATSYM", "SEMICOLON", "COMMA", "PLUS", "MINUS", 
		"STAR", "SLASH", "TILDE", "LT", "EQUALS", "LBRACE", "RBRACE", "DOT", "DARROW", 
		"LE", "ASSIGN", "CLASS", "ELSE", "FI", "IF", "IN", "INHERITS", "LET", 
		"LOOP", "POOL", "THEN", "WHILE", "CASE", "ESAC", "OF", "NEW", "ISVOID", 
		"NOT", "WS", "THEEND", "SINGLE_COMMENT", "COMMENT_CLOSE", "CLOSED", "COM_EOF", 
		"NEWLINE", "ESC", "ESC_NULL", "STR_EOF", "ERR1", "ERR2", "ERR3", "LQUOTE", 
		"NL", "TAB", "BACKSPAC", "LINEFEED", "SLASHN", "ESC_NL"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "CoolParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }


		String filename;
		public void setFilename(String f){
			filename = f;
		}

	/*
		DO NOT EDIT THE FILE ABOVE THIS LINE
		Add member functions, variables below.
	*/


	public CoolParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public AST.program value;
		public Class_listContext cl;
		public TerminalNode EOF() { return getToken(CoolParser.EOF, 0); }
		public Class_listContext class_list() {
			return getRuleContext(Class_listContext.class,0);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(12);
			((ProgramContext)_localctx).cl = class_list();
			setState(13);
			match(EOF);

								((ProgramContext)_localctx).value =  null;
							
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Class_listContext extends ParserRuleContext {
		public List<Class_Context> class_() {
			return getRuleContexts(Class_Context.class);
		}
		public Class_Context class_(int i) {
			return getRuleContext(Class_Context.class,i);
		}
		public List<TerminalNode> SEMICOLON() { return getTokens(CoolParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(CoolParser.SEMICOLON, i);
		}
		public Class_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_class_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitClass_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Class_listContext class_list() throws RecognitionException {
		Class_listContext _localctx = new Class_listContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_class_list);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(21);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==CLASS) {
				{
				{
				setState(16);
				class_();
				setState(17);
				match(SEMICOLON);
				}
				}
				setState(23);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Class_Context extends ParserRuleContext {
		public TerminalNode CLASS() { return getToken(CoolParser.CLASS, 0); }
		public List<TerminalNode> TYPEID() { return getTokens(CoolParser.TYPEID); }
		public TerminalNode TYPEID(int i) {
			return getToken(CoolParser.TYPEID, i);
		}
		public TerminalNode LBRACE() { return getToken(CoolParser.LBRACE, 0); }
		public TerminalNode RBRACE() { return getToken(CoolParser.RBRACE, 0); }
		public TerminalNode INHERITS() { return getToken(CoolParser.INHERITS, 0); }
		public List<FeatureContext> feature() {
			return getRuleContexts(FeatureContext.class);
		}
		public FeatureContext feature(int i) {
			return getRuleContext(FeatureContext.class,i);
		}
		public List<TerminalNode> SEMICOLON() { return getTokens(CoolParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(CoolParser.SEMICOLON, i);
		}
		public Class_Context(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_class_; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitClass_(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Class_Context class_() throws RecognitionException {
		Class_Context _localctx = new Class_Context(_ctx, getState());
		enterRule(_localctx, 4, RULE_class_);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(24);
			match(CLASS);
			setState(25);
			match(TYPEID);
			setState(28);
			_la = _input.LA(1);
			if (_la==INHERITS) {
				{
				setState(26);
				match(INHERITS);
				setState(27);
				match(TYPEID);
				}
			}

			setState(30);
			match(LBRACE);
			setState(36);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==OBJECTID) {
				{
				{
				setState(31);
				feature();
				setState(32);
				match(SEMICOLON);
				}
				}
				setState(38);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(39);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FeatureContext extends ParserRuleContext {
		public TerminalNode OBJECTID() { return getToken(CoolParser.OBJECTID, 0); }
		public TerminalNode LPAREN() { return getToken(CoolParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(CoolParser.RPAREN, 0); }
		public TerminalNode COLON() { return getToken(CoolParser.COLON, 0); }
		public TerminalNode TYPEID() { return getToken(CoolParser.TYPEID, 0); }
		public TerminalNode LBRACE() { return getToken(CoolParser.LBRACE, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode RBRACE() { return getToken(CoolParser.RBRACE, 0); }
		public List<FormalContext> formal() {
			return getRuleContexts(FormalContext.class);
		}
		public FormalContext formal(int i) {
			return getRuleContext(FormalContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(CoolParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(CoolParser.COMMA, i);
		}
		public TerminalNode ASSIGN() { return getToken(CoolParser.ASSIGN, 0); }
		public FeatureContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_feature; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitFeature(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FeatureContext feature() throws RecognitionException {
		FeatureContext _localctx = new FeatureContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_feature);
		int _la;
		try {
			setState(67);
			switch ( getInterpreter().adaptivePredict(_input,6,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(41);
				match(OBJECTID);
				setState(42);
				match(LPAREN);
				setState(51);
				_la = _input.LA(1);
				if (_la==OBJECTID) {
					{
					setState(43);
					formal();
					setState(48);
					_errHandler.sync(this);
					_la = _input.LA(1);
					while (_la==COMMA) {
						{
						{
						setState(44);
						match(COMMA);
						setState(45);
						formal();
						}
						}
						setState(50);
						_errHandler.sync(this);
						_la = _input.LA(1);
					}
					}
				}

				setState(53);
				match(RPAREN);
				setState(54);
				match(COLON);
				setState(55);
				match(TYPEID);
				setState(56);
				match(LBRACE);
				setState(57);
				expr(0);
				setState(58);
				match(RBRACE);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(60);
				match(OBJECTID);
				setState(61);
				match(COLON);
				setState(62);
				match(TYPEID);
				setState(65);
				_la = _input.LA(1);
				if (_la==ASSIGN) {
					{
					setState(63);
					match(ASSIGN);
					setState(64);
					expr(0);
					}
				}

				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FormalContext extends ParserRuleContext {
		public TerminalNode OBJECTID() { return getToken(CoolParser.OBJECTID, 0); }
		public TerminalNode COLON() { return getToken(CoolParser.COLON, 0); }
		public TerminalNode TYPEID() { return getToken(CoolParser.TYPEID, 0); }
		public FormalContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_formal; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitFormal(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FormalContext formal() throws RecognitionException {
		FormalContext _localctx = new FormalContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_formal);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(69);
			match(OBJECTID);
			setState(70);
			match(COLON);
			setState(71);
			match(TYPEID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public TerminalNode LET() { return getToken(CoolParser.LET, 0); }
		public List<TerminalNode> OBJECTID() { return getTokens(CoolParser.OBJECTID); }
		public TerminalNode OBJECTID(int i) {
			return getToken(CoolParser.OBJECTID, i);
		}
		public List<TerminalNode> COLON() { return getTokens(CoolParser.COLON); }
		public TerminalNode COLON(int i) {
			return getToken(CoolParser.COLON, i);
		}
		public List<TerminalNode> TYPEID() { return getTokens(CoolParser.TYPEID); }
		public TerminalNode TYPEID(int i) {
			return getToken(CoolParser.TYPEID, i);
		}
		public TerminalNode IN() { return getToken(CoolParser.IN, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public List<TerminalNode> ASSIGN() { return getTokens(CoolParser.ASSIGN); }
		public TerminalNode ASSIGN(int i) {
			return getToken(CoolParser.ASSIGN, i);
		}
		public List<TerminalNode> COMMA() { return getTokens(CoolParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(CoolParser.COMMA, i);
		}
		public TerminalNode TILDE() { return getToken(CoolParser.TILDE, 0); }
		public TerminalNode ISVOID() { return getToken(CoolParser.ISVOID, 0); }
		public TerminalNode NOT() { return getToken(CoolParser.NOT, 0); }
		public TerminalNode LPAREN() { return getToken(CoolParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(CoolParser.RPAREN, 0); }
		public TerminalNode IF() { return getToken(CoolParser.IF, 0); }
		public TerminalNode THEN() { return getToken(CoolParser.THEN, 0); }
		public TerminalNode ELSE() { return getToken(CoolParser.ELSE, 0); }
		public TerminalNode FI() { return getToken(CoolParser.FI, 0); }
		public TerminalNode WHILE() { return getToken(CoolParser.WHILE, 0); }
		public TerminalNode LOOP() { return getToken(CoolParser.LOOP, 0); }
		public TerminalNode POOL() { return getToken(CoolParser.POOL, 0); }
		public TerminalNode LBRACE() { return getToken(CoolParser.LBRACE, 0); }
		public TerminalNode RBRACE() { return getToken(CoolParser.RBRACE, 0); }
		public List<TerminalNode> SEMICOLON() { return getTokens(CoolParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(CoolParser.SEMICOLON, i);
		}
		public TerminalNode CASE() { return getToken(CoolParser.CASE, 0); }
		public TerminalNode OF() { return getToken(CoolParser.OF, 0); }
		public TerminalNode ESAC() { return getToken(CoolParser.ESAC, 0); }
		public List<TerminalNode> DARROW() { return getTokens(CoolParser.DARROW); }
		public TerminalNode DARROW(int i) {
			return getToken(CoolParser.DARROW, i);
		}
		public TerminalNode NEW() { return getToken(CoolParser.NEW, 0); }
		public TerminalNode INT_CONST() { return getToken(CoolParser.INT_CONST, 0); }
		public TerminalNode STR_CONST() { return getToken(CoolParser.STR_CONST, 0); }
		public TerminalNode BOOL_CONST() { return getToken(CoolParser.BOOL_CONST, 0); }
		public TerminalNode STAR() { return getToken(CoolParser.STAR, 0); }
		public TerminalNode SLASH() { return getToken(CoolParser.SLASH, 0); }
		public TerminalNode PLUS() { return getToken(CoolParser.PLUS, 0); }
		public TerminalNode MINUS() { return getToken(CoolParser.MINUS, 0); }
		public TerminalNode LT() { return getToken(CoolParser.LT, 0); }
		public TerminalNode LE() { return getToken(CoolParser.LE, 0); }
		public TerminalNode EQUALS() { return getToken(CoolParser.EQUALS, 0); }
		public TerminalNode DOT() { return getToken(CoolParser.DOT, 0); }
		public TerminalNode ATSYM() { return getToken(CoolParser.ATSYM, 0); }
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof CoolParserVisitor ) return ((CoolParserVisitor<? extends T>)visitor).visitExpr(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 10;
		enterRecursionRule(_localctx, 10, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(169);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				{
				setState(74);
				match(LET);
				setState(75);
				match(OBJECTID);
				setState(76);
				match(COLON);
				setState(77);
				match(TYPEID);
				setState(80);
				_la = _input.LA(1);
				if (_la==ASSIGN) {
					{
					setState(78);
					match(ASSIGN);
					setState(79);
					expr(0);
					}
				}

				setState(92);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(82);
					match(COMMA);
					setState(83);
					match(OBJECTID);
					setState(84);
					match(COLON);
					setState(85);
					match(TYPEID);
					setState(88);
					_la = _input.LA(1);
					if (_la==ASSIGN) {
						{
						setState(86);
						match(ASSIGN);
						setState(87);
						expr(0);
						}
					}

					}
					}
					setState(94);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(95);
				match(IN);
				setState(96);
				expr(19);
				}
				break;
			case 2:
				{
				setState(97);
				match(TILDE);
				setState(98);
				expr(16);
				}
				break;
			case 3:
				{
				setState(99);
				match(ISVOID);
				setState(100);
				expr(15);
				}
				break;
			case 4:
				{
				setState(101);
				match(NOT);
				setState(102);
				expr(7);
				}
				break;
			case 5:
				{
				setState(103);
				match(OBJECTID);
				setState(104);
				match(ASSIGN);
				setState(105);
				expr(6);
				}
				break;
			case 6:
				{
				setState(106);
				match(OBJECTID);
				setState(107);
				match(LPAREN);
				setState(116);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << OBJECTID) | (1L << BOOL_CONST) | (1L << INT_CONST) | (1L << STR_CONST) | (1L << LPAREN) | (1L << TILDE) | (1L << LBRACE) | (1L << IF) | (1L << LET) | (1L << WHILE) | (1L << CASE) | (1L << NEW) | (1L << ISVOID) | (1L << NOT))) != 0)) {
					{
					setState(108);
					expr(0);
					setState(113);
					_errHandler.sync(this);
					_la = _input.LA(1);
					while (_la==COMMA) {
						{
						{
						setState(109);
						match(COMMA);
						setState(110);
						expr(0);
						}
						}
						setState(115);
						_errHandler.sync(this);
						_la = _input.LA(1);
					}
					}
				}

				setState(118);
				match(RPAREN);
				}
				break;
			case 7:
				{
				setState(119);
				match(IF);
				setState(120);
				expr(0);
				setState(121);
				match(THEN);
				setState(122);
				expr(0);
				setState(123);
				match(ELSE);
				setState(124);
				expr(0);
				setState(125);
				match(FI);
				}
				break;
			case 8:
				{
				setState(127);
				match(WHILE);
				setState(128);
				expr(0);
				setState(129);
				match(LOOP);
				setState(130);
				expr(0);
				setState(131);
				match(POOL);
				}
				break;
			case 9:
				{
				setState(133);
				match(LBRACE);
				setState(139);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << OBJECTID) | (1L << BOOL_CONST) | (1L << INT_CONST) | (1L << STR_CONST) | (1L << LPAREN) | (1L << TILDE) | (1L << LBRACE) | (1L << IF) | (1L << LET) | (1L << WHILE) | (1L << CASE) | (1L << NEW) | (1L << ISVOID) | (1L << NOT))) != 0)) {
					{
					{
					setState(134);
					expr(0);
					setState(135);
					match(SEMICOLON);
					}
					}
					setState(141);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(142);
				match(RBRACE);
				}
				break;
			case 10:
				{
				setState(143);
				match(CASE);
				setState(144);
				expr(0);
				setState(145);
				match(OF);
				setState(153); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(146);
					match(OBJECTID);
					setState(147);
					match(COLON);
					setState(148);
					match(TYPEID);
					setState(149);
					match(DARROW);
					setState(150);
					expr(0);
					setState(151);
					match(SEMICOLON);
					}
					}
					setState(155); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==OBJECTID );
				setState(157);
				match(ESAC);
				}
				break;
			case 11:
				{
				setState(159);
				match(NEW);
				setState(160);
				match(TYPEID);
				}
				break;
			case 12:
				{
				setState(161);
				match(LPAREN);
				setState(162);
				expr(0);
				setState(163);
				match(RPAREN);
				}
				break;
			case 13:
				{
				setState(165);
				match(OBJECTID);
				}
				break;
			case 14:
				{
				setState(166);
				match(INT_CONST);
				}
				break;
			case 15:
				{
				setState(167);
				match(STR_CONST);
				}
				break;
			case 16:
				{
				setState(168);
				match(BOOL_CONST);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(213);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(211);
					switch ( getInterpreter().adaptivePredict(_input,18,_ctx) ) {
					case 1:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(171);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(172);
						match(STAR);
						setState(173);
						expr(15);
						}
						break;
					case 2:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(174);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(175);
						match(SLASH);
						setState(176);
						expr(14);
						}
						break;
					case 3:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(177);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(178);
						match(PLUS);
						setState(179);
						expr(13);
						}
						break;
					case 4:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(180);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(181);
						match(MINUS);
						setState(182);
						expr(12);
						}
						break;
					case 5:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(183);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(184);
						match(LT);
						setState(185);
						expr(11);
						}
						break;
					case 6:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(186);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(187);
						match(LE);
						setState(188);
						expr(10);
						}
						break;
					case 7:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(189);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(190);
						match(EQUALS);
						setState(191);
						expr(9);
						}
						break;
					case 8:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(192);
						if (!(precpred(_ctx, 24))) throw new FailedPredicateException(this, "precpred(_ctx, 24)");
						setState(195);
						_la = _input.LA(1);
						if (_la==ATSYM) {
							{
							setState(193);
							match(ATSYM);
							setState(194);
							match(TYPEID);
							}
						}

						setState(197);
						match(DOT);
						setState(198);
						match(OBJECTID);
						setState(199);
						match(LPAREN);
						setState(208);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << OBJECTID) | (1L << BOOL_CONST) | (1L << INT_CONST) | (1L << STR_CONST) | (1L << LPAREN) | (1L << TILDE) | (1L << LBRACE) | (1L << IF) | (1L << LET) | (1L << WHILE) | (1L << CASE) | (1L << NEW) | (1L << ISVOID) | (1L << NOT))) != 0)) {
							{
							setState(200);
							expr(0);
							setState(205);
							_errHandler.sync(this);
							_la = _input.LA(1);
							while (_la==COMMA) {
								{
								{
								setState(201);
								match(COMMA);
								setState(202);
								expr(0);
								}
								}
								setState(207);
								_errHandler.sync(this);
								_la = _input.LA(1);
							}
							}
						}

						setState(210);
						match(RPAREN);
						}
						break;
					}
					} 
				}
				setState(215);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 5:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 14);
		case 1:
			return precpred(_ctx, 13);
		case 2:
			return precpred(_ctx, 12);
		case 3:
			return precpred(_ctx, 11);
		case 4:
			return precpred(_ctx, 10);
		case 5:
			return precpred(_ctx, 9);
		case 6:
			return precpred(_ctx, 8);
		case 7:
			return precpred(_ctx, 24);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3@\u00db\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\3\2\3\2\3\2\3\3\3\3\3\3\7\3"+
		"\26\n\3\f\3\16\3\31\13\3\3\4\3\4\3\4\3\4\5\4\37\n\4\3\4\3\4\3\4\3\4\7"+
		"\4%\n\4\f\4\16\4(\13\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\7\5\61\n\5\f\5\16\5"+
		"\64\13\5\5\5\66\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5"+
		"\5D\n\5\5\5F\n\5\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\7\5\7S\n\7"+
		"\3\7\3\7\3\7\3\7\3\7\3\7\5\7[\n\7\7\7]\n\7\f\7\16\7`\13\7\3\7\3\7\3\7"+
		"\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\7\7r\n\7\f\7\16\7"+
		"u\13\7\5\7w\n\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\7\7\u008c\n\7\f\7\16\7\u008f\13\7\3\7\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\6\7\u009c\n\7\r\7\16\7\u009d\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\5\7\u00ac\n\7\3\7\3\7\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7"+
		"\3\7\3\7\5\7\u00c6\n\7\3\7\3\7\3\7\3\7\3\7\3\7\7\7\u00ce\n\7\f\7\16\7"+
		"\u00d1\13\7\5\7\u00d3\n\7\3\7\7\7\u00d6\n\7\f\7\16\7\u00d9\13\7\3\7\2"+
		"\3\f\b\2\4\6\b\n\f\2\2\u00fc\2\16\3\2\2\2\4\27\3\2\2\2\6\32\3\2\2\2\b"+
		"E\3\2\2\2\nG\3\2\2\2\f\u00ab\3\2\2\2\16\17\5\4\3\2\17\20\7\2\2\3\20\21"+
		"\b\2\1\2\21\3\3\2\2\2\22\23\5\6\4\2\23\24\7\r\2\2\24\26\3\2\2\2\25\22"+
		"\3\2\2\2\26\31\3\2\2\2\27\25\3\2\2\2\27\30\3\2\2\2\30\5\3\2\2\2\31\27"+
		"\3\2\2\2\32\33\7\34\2\2\33\36\7\4\2\2\34\35\7!\2\2\35\37\7\4\2\2\36\34"+
		"\3\2\2\2\36\37\3\2\2\2\37 \3\2\2\2 &\7\26\2\2!\"\5\b\5\2\"#\7\r\2\2#%"+
		"\3\2\2\2$!\3\2\2\2%(\3\2\2\2&$\3\2\2\2&\'\3\2\2\2\')\3\2\2\2(&\3\2\2\2"+
		")*\7\27\2\2*\7\3\2\2\2+,\7\5\2\2,\65\7\t\2\2-\62\5\n\6\2./\7\16\2\2/\61"+
		"\5\n\6\2\60.\3\2\2\2\61\64\3\2\2\2\62\60\3\2\2\2\62\63\3\2\2\2\63\66\3"+
		"\2\2\2\64\62\3\2\2\2\65-\3\2\2\2\65\66\3\2\2\2\66\67\3\2\2\2\678\7\n\2"+
		"\289\7\13\2\29:\7\4\2\2:;\7\26\2\2;<\5\f\7\2<=\7\27\2\2=F\3\2\2\2>?\7"+
		"\5\2\2?@\7\13\2\2@C\7\4\2\2AB\7\33\2\2BD\5\f\7\2CA\3\2\2\2CD\3\2\2\2D"+
		"F\3\2\2\2E+\3\2\2\2E>\3\2\2\2F\t\3\2\2\2GH\7\5\2\2HI\7\13\2\2IJ\7\4\2"+
		"\2J\13\3\2\2\2KL\b\7\1\2LM\7\"\2\2MN\7\5\2\2NO\7\13\2\2OR\7\4\2\2PQ\7"+
		"\33\2\2QS\5\f\7\2RP\3\2\2\2RS\3\2\2\2S^\3\2\2\2TU\7\16\2\2UV\7\5\2\2V"+
		"W\7\13\2\2WZ\7\4\2\2XY\7\33\2\2Y[\5\f\7\2ZX\3\2\2\2Z[\3\2\2\2[]\3\2\2"+
		"\2\\T\3\2\2\2]`\3\2\2\2^\\\3\2\2\2^_\3\2\2\2_a\3\2\2\2`^\3\2\2\2ab\7 "+
		"\2\2b\u00ac\5\f\7\25cd\7\23\2\2d\u00ac\5\f\7\22ef\7+\2\2f\u00ac\5\f\7"+
		"\21gh\7,\2\2h\u00ac\5\f\7\tij\7\5\2\2jk\7\33\2\2k\u00ac\5\f\7\blm\7\5"+
		"\2\2mv\7\t\2\2ns\5\f\7\2op\7\16\2\2pr\5\f\7\2qo\3\2\2\2ru\3\2\2\2sq\3"+
		"\2\2\2st\3\2\2\2tw\3\2\2\2us\3\2\2\2vn\3\2\2\2vw\3\2\2\2wx\3\2\2\2x\u00ac"+
		"\7\n\2\2yz\7\37\2\2z{\5\f\7\2{|\7%\2\2|}\5\f\7\2}~\7\35\2\2~\177\5\f\7"+
		"\2\177\u0080\7\36\2\2\u0080\u00ac\3\2\2\2\u0081\u0082\7&\2\2\u0082\u0083"+
		"\5\f\7\2\u0083\u0084\7#\2\2\u0084\u0085\5\f\7\2\u0085\u0086\7$\2\2\u0086"+
		"\u00ac\3\2\2\2\u0087\u008d\7\26\2\2\u0088\u0089\5\f\7\2\u0089\u008a\7"+
		"\r\2\2\u008a\u008c\3\2\2\2\u008b\u0088\3\2\2\2\u008c\u008f\3\2\2\2\u008d"+
		"\u008b\3\2\2\2\u008d\u008e\3\2\2\2\u008e\u0090\3\2\2\2\u008f\u008d\3\2"+
		"\2\2\u0090\u00ac\7\27\2\2\u0091\u0092\7\'\2\2\u0092\u0093\5\f\7\2\u0093"+
		"\u009b\7)\2\2\u0094\u0095\7\5\2\2\u0095\u0096\7\13\2\2\u0096\u0097\7\4"+
		"\2\2\u0097\u0098\7\31\2\2\u0098\u0099\5\f\7\2\u0099\u009a\7\r\2\2\u009a"+
		"\u009c\3\2\2\2\u009b\u0094\3\2\2\2\u009c\u009d\3\2\2\2\u009d\u009b\3\2"+
		"\2\2\u009d\u009e\3\2\2\2\u009e\u009f\3\2\2\2\u009f\u00a0\7(\2\2\u00a0"+
		"\u00ac\3\2\2\2\u00a1\u00a2\7*\2\2\u00a2\u00ac\7\4\2\2\u00a3\u00a4\7\t"+
		"\2\2\u00a4\u00a5\5\f\7\2\u00a5\u00a6\7\n\2\2\u00a6\u00ac\3\2\2\2\u00a7"+
		"\u00ac\7\5\2\2\u00a8\u00ac\7\7\2\2\u00a9\u00ac\7\b\2\2\u00aa\u00ac\7\6"+
		"\2\2\u00abK\3\2\2\2\u00abc\3\2\2\2\u00abe\3\2\2\2\u00abg\3\2\2\2\u00ab"+
		"i\3\2\2\2\u00abl\3\2\2\2\u00aby\3\2\2\2\u00ab\u0081\3\2\2\2\u00ab\u0087"+
		"\3\2\2\2\u00ab\u0091\3\2\2\2\u00ab\u00a1\3\2\2\2\u00ab\u00a3\3\2\2\2\u00ab"+
		"\u00a7\3\2\2\2\u00ab\u00a8\3\2\2\2\u00ab\u00a9\3\2\2\2\u00ab\u00aa\3\2"+
		"\2\2\u00ac\u00d7\3\2\2\2\u00ad\u00ae\f\20\2\2\u00ae\u00af\7\21\2\2\u00af"+
		"\u00d6\5\f\7\21\u00b0\u00b1\f\17\2\2\u00b1\u00b2\7\22\2\2\u00b2\u00d6"+
		"\5\f\7\20\u00b3\u00b4\f\16\2\2\u00b4\u00b5\7\17\2\2\u00b5\u00d6\5\f\7"+
		"\17\u00b6\u00b7\f\r\2\2\u00b7\u00b8\7\20\2\2\u00b8\u00d6\5\f\7\16\u00b9"+
		"\u00ba\f\f\2\2\u00ba\u00bb\7\24\2\2\u00bb\u00d6\5\f\7\r\u00bc\u00bd\f"+
		"\13\2\2\u00bd\u00be\7\32\2\2\u00be\u00d6\5\f\7\f\u00bf\u00c0\f\n\2\2\u00c0"+
		"\u00c1\7\25\2\2\u00c1\u00d6\5\f\7\13\u00c2\u00c5\f\32\2\2\u00c3\u00c4"+
		"\7\f\2\2\u00c4\u00c6\7\4\2\2\u00c5\u00c3\3\2\2\2\u00c5\u00c6\3\2\2\2\u00c6"+
		"\u00c7\3\2\2\2\u00c7\u00c8\7\30\2\2\u00c8\u00c9\7\5\2\2\u00c9\u00d2\7"+
		"\t\2\2\u00ca\u00cf\5\f\7\2\u00cb\u00cc\7\16\2\2\u00cc\u00ce\5\f\7\2\u00cd"+
		"\u00cb\3\2\2\2\u00ce\u00d1\3\2\2\2\u00cf\u00cd\3\2\2\2\u00cf\u00d0\3\2"+
		"\2\2\u00d0\u00d3\3\2\2\2\u00d1\u00cf\3\2\2\2\u00d2\u00ca\3\2\2\2\u00d2"+
		"\u00d3\3\2\2\2\u00d3\u00d4\3\2\2\2\u00d4\u00d6\7\n\2\2\u00d5\u00ad\3\2"+
		"\2\2\u00d5\u00b0\3\2\2\2\u00d5\u00b3\3\2\2\2\u00d5\u00b6\3\2\2\2\u00d5"+
		"\u00b9\3\2\2\2\u00d5\u00bc\3\2\2\2\u00d5\u00bf\3\2\2\2\u00d5\u00c2\3\2"+
		"\2\2\u00d6\u00d9\3\2\2\2\u00d7\u00d5\3\2\2\2\u00d7\u00d8\3\2\2\2\u00d8"+
		"\r\3\2\2\2\u00d9\u00d7\3\2\2\2\26\27\36&\62\65CERZ^sv\u008d\u009d\u00ab"+
		"\u00c5\u00cf\u00d2\u00d5\u00d7";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}