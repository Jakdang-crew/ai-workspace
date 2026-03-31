# 액션 트래커

> 로드맵 실행 현황을 추적하는 문서
> 마지막 업데이트: 2026-04-01

---

## 1단계: 워크플로우 안정화 (목표: ~2026-05)

### 마일스톤 1.1: Plugin Marketplace 저장소 구축 ✅

- [x] GitHub 저장소 생성 + submodule로 워크스페이스에 등록
- [x] 플러그인 표준 포맷 정의 (메타데이터, 디렉토리 구조)
- [x] 카테고리 분류 체계 설계 (agent / skill / command / rule)
- [x] README (영어) 작성 + 프로젝트 구조 설명

### 마일스톤 1.2: CLAUDE.md 설계 ✅

- [x] 역할 정의 (Role) 작성
- [x] 코딩 컨벤션 및 금지 패턴 목록 작성
- [x] 출력 포맷 규칙 정의
- [x] 에러 핸들링 규칙 정의
- [x] 파일 구조 규칙 정의

### 마일스톤 1.3: 첫 번째 플러그인 + 워크플로우

- [ ] 자동화할 반복 태스크 1개 선정
- [ ] command 또는 skill 플러그인으로 작성 → 마켓플레이스에 등록
- [ ] 프롬프트 구조화 (Role → Context → Task → Constraints → Format)
- [ ] 5회 반복 실행으로 결과 일관성 검증
- [ ] 실패 시 원인 분류 (프롬프트/컨텍스트/오케스트레이션/툴)

### 마일스톤 1.4: hooks 및 Fallback 패턴

- [ ] hooks 기능 학습 → hook 플러그인으로 마켓플레이스에 등록
- [ ] pre-commit 자동 검증 로직 구현
- [ ] 3단계 fallback 설계 (재시도 → 단순화 → 사람 위임)

### 마일스톤 1.5: 블로그 첫 글

- [ ] 워크플로우 구축 과정을 소재로 초안 작성
- [ ] Before/After 프롬프트 또는 코드 포함
- [ ] 벨로그 또는 개인 블로그 게시

---

## 2단계: Kotlin + Spring Boot + AI (목표: ~2026-07)

### 마일스톤 2.1: Spring AI 프로젝트 부트스트랩

- [ ] Spring Initializr로 Kotlin + Spring Boot 3.4.x + Spring AI 프로젝트 생성
- [ ] `spring-ai-anthropic-spring-boot-starter` 의존성 추가
- [ ] ChatClient 기반 엔드포인트 1개 구현
- [ ] 환경 변수 API 키 관리 설정
- [ ] Actuator 토큰 사용량 모니터링 설정

### 마일스톤 2.2: RAG 파이프라인 구현

- [ ] 벡터 DB 선택 및 설정 (pgvector 권장)
- [ ] 문서 수집 레이어 (Spring AI ETL)
- [ ] 청킹 전략 실험 (고정 크기 vs 시맨틱)
- [ ] 임베딩 + 벡터 스토어 연동
- [ ] 하이브리드 검색 (키워드 + 벡터) 구현
- [ ] 리랭킹 단계 추가

### 마일스톤 2.3: AWS Bedrock 통합

- [ ] Bedrock 접근 설정 (IAM, 리전)
- [ ] Lambda + Kotlin 서버리스 함수 구현
- [ ] GraalVM Native Image 빌드 설정
- [ ] 모델 라우팅 로직 (태스크별 최적 모델)

### 마일스톤 2.4: 테스트 / 모니터링

- [ ] Golden Dataset 100쌍 구축
- [ ] Evaluation-Driven Testing 도입
- [ ] Micrometer 기반 토큰/지연/비용 메트릭 설정
- [ ] 프롬프트 캐싱 + 모델 폴백 비용 최적화

---

## 3단계: 실전 포지셔닝 (목표: ~2026-09)

### 마일스톤 3.1: 포트폴리오 프로젝트 1 완성

- [ ] AI 코드 리뷰 에이전트 MVP
- [ ] GitHub Webhook 연동
- [ ] 코드 diff 청킹 + RAG 리뷰 생성
- [ ] 피드백 루프 (유용함/불필요 마킹 → 프롬프트 개선)
- [ ] 할루시네이션 검증 레이어
- [ ] README (영어) + 아키텍처 다이어그램
- [ ] ADR 문서 작성

### 마일스톤 3.2: 기술 브랜딩

- [ ] 기술 블로그 누적 6편 이상
- [ ] GitHub 프로필 정비 (프로젝트 README, 이슈/PR 체계화)

---

## 완료된 항목

| 날짜 | 항목 | 비고 |
|------|------|------|
| 2026-03-29 | 워크스페이스 구축 | journal, notes, practices, projects 구조 |
| 2026-03-29 | 로드맵 작성 및 구조화 | notes/ai-native-roadmap.md |
| 2026-03-29 | 마일스톤 1.1 완료 | marketplace 저장소, 플러그인 스펙, 카테고리, README |
| 2026-03-31 | 리포 조직 이전 | htcmw → Jakdang-crew 조직으로 이전 |
| 2026-04-01 | 마일스톤 1.2 완료 | CLAUDE.md 설계 (Role, 컨벤션, 금지 패턴, 에러 핸들링, 파일 구조) |
| 2026-04-01 | 플러그인 2개 등록 | kotlin-conventions, ask-before-build (rule) |
| 2026-04-01 | marketplace 히스토리 선형화 | merge 커밋 제거, rebase로 정리 |
