package co.kr.yangpa.mypage;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface MypageDAO {

	List<BoardDTO> mypage(BoardDTO inDto);

	List<BoardDTO> basket_list(BoardDTO inDto);

}
