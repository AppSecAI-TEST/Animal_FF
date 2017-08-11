package paging;

public class PagingUtil {
	public static PagingBean setPagingInfo(PagingBean paging){
		
		paging.setCountPerPage(10);		// 한 페이지당 10개의 게시글(리스트)가 보여짐
		paging.setBlockCount(10);		
		
		paging.setStartNum(paging.getTotalCount() - (paging.getNowPage()-1) * paging.getCountPerPage());
		// 올린글의 갯수 12
		//	총		 2 page
		//	1페이지의 경우		totalcount 12				1				-1	*	10			== 12
		
		System.out.println("paging.getTotalCount : " + paging.getTotalCount());
		System.out.println("paging.getNowPage : " + paging.getNowPage());
		System.out.println("paging.getCountPerPage : " + paging.getCountPerPage());
		System.out.println("paging.getStartNum : " + paging.getStartNum());
		
		return paging;
	}
}
