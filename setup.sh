#!/bin/sh
#set -e : エラーが起きた行で実行終了
set -e

if [ ! $# -eq 1 ]; then
  echo "USAGE: ./setup.sh (STANFORD_PARSER_DIR)" >&2
  exit 1
fi

#stanford-parserのディレクトリを設定してください。
#STANFORD_PARSER_DIR=~/local/src/stanford-parser-full-2015-04-20
STANFORD_PARSER_DIR=$1

#STANFORD_PARSER_DIRに設定したディレクトリがなかったら終了
if [ ! -e $STANFORD_PARSER_DIR ]; then
  echo "ERROR:STANFORD_PARSER_DIRに設定したディレクトリが存在しません。" >&2
  exit 1
fi

cd $STANFORD_PARSER_DIR

#シリアライズされた文法ファイルをmodelのjarファイルから抽出
#edu/stanford/nlp/models/あたりに出力されるはず
jar -xf stanford-parser-3.5.2-models.jar #=> edu/stanford/nlp/models/lexparser/germanFactored.ser.gz など

#サンプル文
echo "Ich bin japaner." > input.txt

echo "これで準備が完了したはずなので、"
echo "./lexparser-lang.sh German 10 edu/stanford/nlp/models/lexparser/germanFactored.ser.gz \"out\" input.txt"
echo "を実行してください。
echo ""10は入力する文長の最大値、outは出力ファイルのprefixです。ここでは、出力はinput.txt.out.10.stpとなります。"
echo "lexparser-lang.shのヘルプは、lexparser-lang.shを引数なしで実行すると表示されます。"
