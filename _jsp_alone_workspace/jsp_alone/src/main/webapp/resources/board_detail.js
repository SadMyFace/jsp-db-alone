/**
 *
 */
console.log('board_detail.js in~!!!');
console.log(bnoVal);

async function getCommentListFromServer(bno) {
  try {
    const resp = await fetch('/cmt/list/' + bno);
    const result = await resp.json();
    return result;
  } catch (error) {
    console.log(error);
  }
}

function spreadCommentList(result) {
  console.log('comment List >>> ' + result);
  let div = document.getElementById('commentLine');
  div.innerHTML = '';
  let writer = document.getElementById('cmtWriter').value;
  console.log(writer);
  for (let i = 0; i < result.length; i++) {
    let html = `<div class="d-inline">`;
    html += `<div>${result[i].cno}, ${result[i].bno}, ${result[i].writer}, ${result[i].regdate}</div>`;
    html += `<div>`;
    html += `<input type="text" value="${result[i].content}" class="cmtText">`;

    if (writer == result[i].writer) {
      html += `<button type="button" data-cno="${result[i].cno}" class="cmtModBtn btn btn-primary btn-sm">수정</button>`;
      html += `<button type="button" data-cno="${result[i].cno}" class="cmtDelBtn btn btn-primary btn-sm">삭제</button> <br>`;
    }

    html += `</div></div><br><hr>`;
    div.innerHTML += html;
  }
}

//comment 출력
function printCommentList(bno) {
  getCommentListFromServer(bno).then(result => {
    console.log(result);
    if (result.length > 0) {
      spreadCommentList(result);
    } else {
      let div = document.getElementById('commentLine');
      div.innerHTML = `<div>comment가 없습니다.</div>`;
    }
  });
}
/** 컨트롤러로 글번호, 작성자, 내용을 전송 */
async function postCommentToServer(cmtData) {
  try {
    const url = '/cmt/post';
    const config = {
      method: 'post',
      Headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: JSON.stringify(cmtData),
    };

    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

//댓글 작성
document.getElementById('cmtAddBtn').addEventListener('click', () => {
  const cmtText = document.getElementById('cmtText').value;
  if (cmtText == null || cmtText == '') {
    alert('댓글을 입력해주세요.');
    return false;
  } else {
    let cmtData = {
      bno: bnoVal,
      writer: document.getElementById('cmtWriter').value,
      content: cmtText,
    };

    postCommentToServer(cmtData).then(result => {
      console.log(result);
      if (result > 0) {
        alert('댓글 등록 성공~!!');
        document.getElementById('cmtText').value = '';
      }
      printCommentList(bnoVal);
    });
  }
});

//댓글 삭제
async function removeCommentFromServer(cnoVal) {
  try {
    const url = '/cmt/remove?cnoVal=' + cnoVal;
    const resp = await fetch(url);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

//댓글 수정
async function updateCommentFromServer(cnoVal, cmtText) {
  try {
    const url = '/cmt/modify';
    const config = {
      method: 'post',
      Headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({ cno: cnoVal, content: cmtText })
    }

    const resp = await fetch(url, config);
    const result = resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.addEventListener('click', (e) => {
  console.log(e.target);
  if (e.target.classList.contains('cmtDelBtn')) {
    let cnoVal = e.target.dataset.cno;
    console.log(cnoVal);
    removeCommentFromServer(cnoVal).then(result => {
      if (result > 0) {
        alert('댓글 삭제 성공~!!');
        printCommentList(bnoVal);
      }
    })
  } else if (e.target.classList.contains('cmtModBtn')) {
    let cnoVal = e.target.dataset.cno;
    console.log(cnoVal);

    let div = e.target.closest('div');
    let cmtText = div.querySelector('.cmtText').value;
    console.log(cmtText);
    updateCommentFromServer(cnoVal, cmtText).then(result => {
      if (result > 0) {
        alert('댓글 수정 성공~!!');
        printCommentList(bnoVal);
      }
    })
  }
})
