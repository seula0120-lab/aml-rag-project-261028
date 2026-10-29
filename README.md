# AML 합성 임상데이터 질의응답 RAG

AML(급성골수성백혈병) **가상(합성) 임상데이터**와 문헌 자료에 한글로 질문하면 근거와 함께 답해 주는 화면입니다.
파일 하나(`AML_통합_RAG-5_v2.html`)로 동작하고, AI는 내 컴퓨터의 Ollama를 쓰기 때문에 API 비용이 들지 않고 자료가 밖으로 나가지 않습니다.

> 교육·시연용 합성 데이터 기반입니다. 실제 진단·치료 판단에 사용할 수 없습니다.

## 어떻게 답하나
1. 입력 검사: 실제 환자 상담·개인정보 요청은 막습니다.
2. 숫자 질문(반응률, 사망 수, 생존기간 등)은 AI가 아니라 **코드가 원자료로 직접 계산**합니다.
3. 뜻·방법 질문은 검색(단어 일치 BM25 + 의미 검색 bge-m3)으로 자료를 찾습니다.
4. AI(qwen2.5:7b)가 찾은 자료만 보고 풀어 씁니다.
5. 답변 검사: 근거 없는 숫자, 인과 표현, 없는 번호 인용을 찾아 걸리면 다시 쓰게 하고, 그래도 안 되면 계산 결과만 보여 줍니다.

## 실행 방법 (Mac)
1. [Ollama](https://ollama.com)를 설치합니다.
2. 이 저장소를 내려받습니다(Code → Download ZIP).
3. `RAG_열기.command`를 더블클릭합니다. Ollama 확인 → 모델 설치(처음 한 번, 몇 GB) → 화면 서버 → 브라우저 열기를 자동으로 합니다.
   - "확인되지 않은 개발자" 경고가 뜨면 파일을 우클릭 → 열기를 누르세요.
   - 실행 권한 오류가 나면 터미널에서 `chmod +x RAG_열기.command`
4. 브라우저가 열리면 왼쪽 **원자료 CSV 불러오기**에서 수강생 CSV(`Synthetic clinical dataset_Student_v2.csv`)를 선택합니다.

HTML 파일을 직접 더블클릭하면 Ollama가 접속을 거절해서 연결되지 않습니다. 꼭 `RAG_열기.command`로 여세요.

Windows/Linux는 Ollama를 켜고 `ollama pull qwen2.5:7b`, `ollama pull bge-m3` 후, 이 폴더에서 `python3 -m http.server 8011`을 실행하고 `http://localhost:8011/AML_통합_RAG-5_v2.html`을 여세요.

## 원자료(CSV)에 대해
- **원자료는 이 저장소에 들어 있지 않습니다**(대외비). 수강생 데이터를 가진 사람이 화면에서 직접 불러옵니다.
- 파일은 브라우저 안에서만 처리되며 어디로도 전송되지 않습니다. 이 브라우저(localStorage)에만 저장되고, **불러온 원자료 지우기** 버튼으로 지울 수 있습니다.
- CSV 없이도 열리고 문헌·데이터 사전 검색과 AI 설명은 쓸 수 있습니다. 다만 숫자 계산 도구가 꺼지므로 숫자 질문은 내장 통계 자료로만 답해 정확하지 않을 수 있습니다.

## 확인 방법
주소 끝에 `?test`를 붙여 열면 부품 검증 111개가 자동으로 돌아갑니다. CSV를 불러온 상태에서 `RAG_열기.command`로 열면 모두 통과합니다.
CSV를 불러오지 않았다면 원자료가 필요한 시험 약 20개는 실패로 표시됩니다(정상).

## 문서
- [`AML_통합_RAG_요약.pdf`](AML_통합_RAG_요약.pdf): 문제·설계·구현·측정·개선·배움을 정리한 자료(22장, 복사·수정 금지 권한이 걸린 PDF)

## 참고 논문
이 화면의 내장 "지식 문서"는 아래 논문들을 바탕으로 팀이 직접 정리한 설명입니다. [`논문/`](논문/) 폴더의 PDF는 **화면을 열면 자동으로 불러와 검색에 포함됩니다**(`RAG_열기.command`로 열었을 때, Ollama가 켜져 있어야 합니다). 처음 한 번은 임베딩 계산에 1분 안팎 걸리고, 결과는 브라우저에 저장돼 다음부터는 몇 초면 됩니다. 폴더에 PDF를 더 넣으면 다음에 열 때 함께 들어갑니다. 실제 환자 연구라 합성 데이터 숫자와 섞이지 않게 따로 다룹니다. 라이선스(CC BY 4.0)로 재배포가 허용된 것만 넣었고, 자세한 내용은 [`논문/README.md`](논문/README.md)에 있습니다.

- 폴더에 있음: 2번 원문, 2·3·4번의 한글 해설
- 폴더에 없음: 1번(ELN 2022 권고안) — CC BY-NC-ND라 번역·요약본을 다시 배포할 수 없어서 링크만 둡니다. 원문 PDF는 직접 받아 올리세요.

| # | 논문 | 출처 | DOI |
|---|---|---|---|
| 1 | Döhner H, et al. *Diagnosis and management of AML in adults: 2022 recommendations from an international expert panel on behalf of the ELN* | Blood 2022;140(12):1345–1377 | [10.1182/blood.2022016867](https://doi.org/10.1182/blood.2022016867) |
| 2 | Khoury JD, et al. *The 5th edition of the World Health Organization Classification of Haematolymphoid Tumours: Myeloid and Histiocytic/Dendritic Neoplasms* | Leukemia 2022;36:1703–1719 | [10.1038/s41375-022-01613-1](https://doi.org/10.1038/s41375-022-01613-1) |
| 3 | Rausch C, et al. *Validation and refinement of the 2022 European LeukemiaNet genetic risk stratification of acute myeloid leukemia* | Leukemia 2023;37:1234–1244 | [10.1038/s41375-023-01884-2](https://doi.org/10.1038/s41375-023-01884-2) |
| 4 | Song GY, et al. *Validation of the 2022 European LeukemiaNet risk stratification for acute myeloid leukemia* | Sci Rep 2024;14:8517 | [10.1038/s41598-024-57295-5](https://doi.org/10.1038/s41598-024-57295-5) |

- 1번(ELN 2022)은 AML 위험 분류(양호·중간·불량)와 치료 반응 기준(CR/CRi/PR/NR)의 근거입니다.
- 2번(WHO 5판)은 진단 분류, 3·4번은 ELN 2022 위험 분류를 독일·한국 환자 코호트에서 검증한 연구입니다(MR 변이군 평가가 엇갈림).

## 결과 (개발 기록)
- 질문 30문항 평가: 순수 RAG 60.0% → 계산 도구 83.3% → 지시문 90.0% → 답변 검사 96.7% → 최종 100.0%
- 처음 보는 신규 17문항: 수정 전 11.8% → 수정 후 70.6% (평가셋 100%는 새 질문에서는 그대로 믿을 수 없음)
