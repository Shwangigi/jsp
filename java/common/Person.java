package common;

public class Person {
	// 자바 빈즈 규약
	// 1. 기본(default) 패키지 이외에 패키지에 속해야한다 
	// 2. 필드는 private
	// 3. 기본생성자는 있어야한다
	// 4. 게터/세터는 public이어야 한다
	// 5. 게터/세터 메서드가 있어야한다.
	
	// 필드 -> 멤버변수
	private String name;
	private int age;
	
	// 생성자
	public Person() { } // 기본생성자
	
	

	public Person(String name, int age) { // 커스텀 생성자
//		super();
		this.name = name;
		this.age = age;
	}



	//게터,세터
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}
