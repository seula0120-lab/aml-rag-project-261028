# 논문 폴더

`RAG_열기.command`로 화면을 열면 이 폴더의 PDF를 **자동으로 불러와** 질문할 때 함께 검색합니다. 새 PDF를 이 폴더에 넣어 두면 다음에 열 때 같이 들어갑니다.
- 화면 왼쪽 **3. PDF 문헌 추가**의 "논문/ 폴더 PDF 자동 불러오기" 버튼으로 다시 불러올 수도 있습니다(Ollama를 나중에 켰을 때 등).
- HTML을 직접 더블클릭해서 열면 폴더를 읽을 수 없어 자동 불러오기가 동작하지 않습니다.
- PDF를 읽는 PDF.js 라이브러리를 인터넷에서 받아오므로 인터넷 연결이 필요합니다.
실제 환자 연구라서 합성 데이터의 숫자와 섞이지 않게 답변 지시문 7번이 따로 막습니다.

## 들어 있는 파일

| 파일 | 내용 | 라이선스 |
|---|---|---|
| `Khoury2022_WHO5판_원문.pdf` | Khoury JD, et al. *The 5th edition of the World Health Organization Classification of Haematolymphoid Tumours: Myeloid and Histiocytic/Dendritic Neoplasms.* Leukemia 2022;36:1703–1719. [doi:10.1038/s41375-022-01613-1](https://doi.org/10.1038/s41375-022-01613-1) | CC BY 4.0 |
| `세논문_한글해설_WHO5판_ELN2022검증.pdf` | 아래 3편(Khoury 2022, Rausch 2023, Song 2024)을 한국어로 풀어 쓴 해설 | 원 논문 3편이 모두 CC BY 4.0 |

한글 해설은 원 논문을 번역·재구성한 것이라 **원 논문과 표현·구성이 다르며 오류가 있을 수 있습니다.** 정확한 내용은 원문으로 확인하세요.

## 해설이 다룬 논문 (모두 CC BY 4.0, 저자 저작물)
1. Khoury JD, et al. Leukemia 2022;36:1703–1719. [doi:10.1038/s41375-022-01613-1](https://doi.org/10.1038/s41375-022-01613-1)
2. Rausch C, et al. *Validation and refinement of the 2022 European LeukemiaNet genetic risk stratification of acute myeloid leukemia.* Leukemia 2023;37:1234–1244. [doi:10.1038/s41375-023-01884-2](https://doi.org/10.1038/s41375-023-01884-2)
3. Song GY, et al. *Validation of the 2022 European LeukemiaNet risk stratification for acute myeloid leukemia.* Sci Rep 2024;14:8517. [doi:10.1038/s41598-024-57295-5](https://doi.org/10.1038/s41598-024-57295-5)

CC BY 4.0: https://creativecommons.org/licenses/by/4.0/

## 들어 있지 않은 것
- **ELN 2022 권고안** (Döhner H, et al. Blood 2022;140:1345–1377, [doi:10.1182/blood.2022016867](https://doi.org/10.1182/blood.2022016867)): 라이선스가 CC BY-NC-ND 4.0이라 번역·요약본을 다시 배포할 수 없어서 넣지 않았습니다. 원문 PDF는 위 링크에서 직접 받아 화면에서 올려 쓰세요.
