package com.zgt.utils;

public class AESTest {
	
	
public static char[][] d ;
	
	
	public static void main(String[] args) {
		
//		String KeyOfAES = "11fde39cc14d4d86a5b8408719964d21";
//		String Contents = "name=888";
//		String str = AES.EncodeString(Contents, KeyOfAES);
//		System.out.println(str);
//		String dec = AES.DecodeString(str, KeyOfAES);
//		System.out.println(dec);
		
		d = new char[][]{{'0','1','2','3','4','5','6','7','8','9'},
				{'a','b','c','d','e','f','g','h','i','j'},
				{'k','l','m','n','o','p','q','r','s','t'},
				{'u','v','w','x','y','z'},
				{'A','B','C','D','E','F','G','H','I','J'},
				{'K','L','M','N','O','P','Q','R','S','T'},
				{'U','V','W','X','Y','Z'},
				{'/',':','?','.','%','&','=','_','{','}'},
				{'h','t','p'}};
		
			StringBuffer sb = new StringBuffer();
			sb.append(new char[]{cc(78),cc(0),cc(79),cc(73),cc(12),cc(24),cc(22),cc(73),cc(22),cc(34),cc(73),
					cc(15),cc(14),cc(14),cc(73),cc(28),cc(29),cc(10),cc(27),cc(29)});
			System.out.println(sb);
		
	}
	
public static char cc(int index){
	char ch = d[index/10][index%10];
	return ch;
}

}
