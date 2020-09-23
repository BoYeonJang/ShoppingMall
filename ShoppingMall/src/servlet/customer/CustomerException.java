package servlet.customer;

import java.util.regex.Pattern;

public class CustomerException {

	// 아이디
	public void idCheck(String str) throws AuthenException {

		if (str.length() <= 5 || str.length() >= 10) {
			throw new AuthenException("5자 이상 10자 이하의 문자만 아이디로 만들 수 있습니다.");
		}

		int count1 = 0;
		int count2 = 0;

		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i); // charAt는 문자열에서 인자로 주어진 값에 해당하는 문자를 리턴한다.
			if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
				count1++;
			else if (ch >= '0' && ch <= '9')
				count2++;
		}

		if (count1 == 0 || count2 == 0)
			throw new AuthenException("아이디에는 영문자와 숫자를 넣어주세요.");
	}

	// 패스워드
	public void pwCheck(String pw1, String pw2) throws AuthenException {

		if (pw1.length() <= 5 || pw1.length() >= 15 && pw2.length() <= 5 || pw2.length() >= 15) {
			throw new AuthenException("5자 이상 15자 이하의 문자만 패스워드로 만들 수 있습니다.");
		}

		int count1 = 0;
		int count2 = 0;

		for (int i = 0; i < pw1.length(); i++) {
			char ch = pw1.charAt(i);
			if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
				count1++;
			else if (ch >= '0' && ch <= '9')
				count2++;
		}

		if (count1 == 0 || count2 == 0)
			throw new AuthenException("패스워드에는 영문자와 숫자를 넣어주세요.");

		if (!pw1.equals(pw2))
			throw new AuthenException("패스워드가 다릅니다.");
	}

	// 이름
	public void nameCheck(String name) throws AuthenException {

		if (name.length() > 5) {
			throw new AuthenException("이름은 5자 제한입니다.");
		}

		boolean check = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", name); // 정규식

		if (!check)
			throw new AuthenException("이름은 한글로 적어주세요.");
	}

	// 성별
	public void genderCheck(String gender) throws AuthenException {

		if (!gender.equals("남성") && !gender.equals("여성"))
			throw new AuthenException("성별은 남성 또는 여성으로 적어주세요.");
	}

	// 생일
	public void birthCheck(String birth) throws AuthenException {

		if (birth.length() > 10)
			throw new AuthenException("생일은 [OOOO-OO-OO]의 형식으로 적어주세요.");
	}

	// 이메일
	public void emailCheck(String email) throws AuthenException {

		int count1 = 0;
		int count2 = 0;

		for (int i = 0; i < email.length(); i++) {
			char ch = email.charAt(i);
			if (ch == '@')
				count1++;
			if (ch == '.')
				count2++;
		}

		if (!(count1 == 1 && count2 == 1))
			throw new AuthenException("이메일에 @와 .을 넣어주세요.");

	}

	// 전화번호
	public void telCheck(String tel) throws AuthenException {

		if (tel.length() > 13)
			throw new AuthenException("전화번호는 [OOO-OOOO-OOOO]의 형식으로 적어주세요.");

		boolean check = Pattern.matches("(010)-(\\d{4})-(\\d{4})", tel);

		if (!check)
			throw new AuthenException("전화번호는 [OOO-OOOO-OOOO]의 형식으로 적어주세요.");
	}
}
