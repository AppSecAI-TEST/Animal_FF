package Member;

public interface iMemberDao {

    public boolean addMember(MemberDto dto);
    public void log(String msg);
    public boolean check(String id);
    public MemberDto login(MemberDto dto);
}
