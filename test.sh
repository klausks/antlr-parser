ANTLR_PATH=$(pwd)/src/main/antlr/antlr-4.13.2-complete.jar
GRAMMAR_PATH=$(pwd)/src/main/antlr/SourceGrammar.g4
echo $ANTLR_PATH
CP=$ANTLR_PATH
export CLASSPATH=$CP

if [ ! -d tmp ]; then
  mkdir tmp
fi
cd tmp
echo $CP

# Build analyzers based on source grammar
java -Xmx500M -cp $CP org.antlr.v4.Tool $GRAMMAR_PATH
javac SourceGrammar*.java

# Run analysis
java -Xmx500M -cp $CP org.antlr.v4.gui.TestRig SourceGrammar r -tree