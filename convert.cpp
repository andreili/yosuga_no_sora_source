#include <regex>
#include <fstream>
#include <iostream>

using std::wstring;

wstring ex_from[] = {L"\tCALL ScenarioEnter\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScPlayEnvSe\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL SetCg\n\tNOP",
					 L"\tPUSH_VAL String \"(.+)\"\n\tPUSH_VAL String \"(.*)\"\n\tCALL Talk\n\tNOP",
					 L"\tPUSH_VAL String \"(.+)\"\n\tCALL Mess\n\tNOP",
					 L"\tPUSH_OBJ  1\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Hitret\n\tPOP =\n\tNOP",
					 L"\tPUSH_OBJ  1\n\tPUSH_VAL Integer 30i\n\t==\n\tPUSH_OBJ  1\n\tPUSH_VAL Integer 20i\n\t==\n\tor\n\tJUMP_OK (.+)\n\tPUSH_VAL String \"EXIT_SCENARIO\"\n\tCALL Change\n\tNOP\n\tPUSH_VAL Integer 0i\n\tReturn\n\tJUMP (.+)\n@(.+):\n\tPUSH_OBJ  1\n\tPUSH_VAL Integer 40i\n\t==\n\tJUMP_OK (.+)\n\tPUSH_VAL Integer 0i\n\tReturn\n@(.+):",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL BlackOut\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL WhiteOut\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScPlaySe\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL String \"(\\w*)\"\n\tCALL Flush\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScStopEnvSe\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScPlayBgm\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL String \"(\\w*)\"\n\tCALL Font\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScWait\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tCALL ScPlayMovie\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tCALL Change\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tCALL Tone\n\tNOP",
					 L"\tPUSH_VAL Integer 0i\n\tReturn",
					 L"\t@@Initialize\n\n\tReturn this",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL WindowView\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL BustupClear\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL OnRecollectFlag\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Shake\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ScStopBgm\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL StaffRoll\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Update\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL ChkSelect\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL OnFlag\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Jump\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Down\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Down\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Scroll\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Quake\n\tNOP",
					 L"\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL BustupLeave\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL EyeCatchEnter\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL Transition\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL AddSelect\n\tNOP",
					 L"\tPUSH_VAL String \"(\\w*)\"\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tPUSH_VAL Integer (\\S*\\w+)i\n\tCALL SetBustup\n\tNOP",
					 L"\tCALL (\\w*)\n\tNOP"};
wstring ex_to[] = {L"\tScenarioEnter()",
				   L"\tScPlayEnvSe(\"$1\", \"$2\", $3)",
				   L"\tSetCg(\"$1\", $2, $3)",
				   L"\tTalk(\"$1\", \"$2\")",
				   L"\tMess(\"$1\")",
				   L"\thitretResult := Hitret($1)",
				   L"\tIf ((hitretResult == 30) | (hitretResult == 20))\n\t\tChange(\"EXIT_SCENARIO\")\n\t\tReturn\n\tElseIf (hitretResult == 40)\n\t\tReturn\n\tEndIf",
				   L"\tBlackOut($1, $2)",
				   L"\tWhiteOut($1, $2)",
				   L"\tScPlaySe(\"$1\", $2)",
				   L"\tFlush(\"$1\", $2, \"$3\")",
				   L"\tScStopEnvSe(\"$1\", $2)",
				   L"\tScPlayBgm(\"$1\", $2)",
				   L"\tFont($1, \"$2\")",
				   L"\tScWait($1, $2)",
				   L"\tScPlayMovie(\"$1\")",
				   L"\tChange(\"$1\")",
				   L"\tTone(\"$1\")",
				   L"\tReturn",
				   L"",
				   L"\tWindowView($1)",
				   L"\tBustupClear($1)",
				   L"\tOnRecollectFlag($1)",
				   L"\tShake($1)",
				   L"\tScStopBgm($1)",
				   L"\tStaffRoll($1)",
				   L"\tUpdate($1)",
				   L"\tChkSelect($1)",
				   L"\tOnFlag($1)",
				   L"\tJump($1, $2)",
				   L"\tDown($1, $2, $3, $4)",
				   L"\tDown($1, $2, $3, $4)",
				   L"\tScroll($1, $2, $3, $4, $5)",
				   L"\tQuake($1, $2, $3, $4, $5)",
				   L"\tBustupLeave($1, $2, $3, $4, $5, $6)",
				   L"\tEyeCatchEnter(\"$1\", $2)",
				   L"\tTransition(\"$1\", $2)",
				   L"\tAddSelect(\"$1\", $2)",
				   L"\tSetBustup(\"$1\", $2, $3)",
				   L"\t$1()",};

std::wstring replaceSubstring(std::wstring find, std::wstring str, std::wstring replace) 
{   
    std::wstring const text(str);
    std::wregex const reg(find);

    std::wstring swap_str(replace);

    return std::regex_replace(text, reg, swap_str);
}

int main(int argc, char **argv)
{
	if (argc != 2)
		return 1;
	
	std::string fn = argv[1];
	std::ifstream is(fn, std::ifstream::binary); 
	is.seekg (0, is.end);
    int length = is.tellg();
    is.seekg (0, is.beg);
	wchar_t *data = new wchar_t[length];
	is.read((char*)data, length);
	wstring body = data;
	delete[] data;
	is.close();
	/*for (size_t i=0 ; i<body.length() ; ++i)
		if ((body[i] == L'\n') || (body[i] == L'\t'))
			body[i] = L' ';*/
	
	int i = 0;
	for (wstring from_ : ex_from)
	{
		//std::wcout << from_ << std::endl;
		wstring to_ = ex_to[i++];
		std::wregex expr(from_);
		size_t l1;
		do
		{
			l1 = body.length();
			body = std::regex_replace(body, expr, to_);
		} while (l1 != body.length());
		/*while (std::regex_match(body, expr))
		{
			std::wcout << L"matched" << std::endl;
			body = std::regex_replace(body, expr, to_);
			//replaceSubstring(from_, body, to_);
		}*/
	}
	
	std::ofstream outfile(fn + "_new", std::ofstream::binary);
	outfile.write((char*)&body[0], sizeof(wchar_t) * body.length());
	outfile.close();
}
