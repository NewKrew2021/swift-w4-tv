# swift-w4-tv
모바일 4주차 TV 저장소


1. make MainVC
- MainViewController 생성


2. make Model
- OriginalTV, LiveTV, Channel, Clip, Live 모델 생성


3. make sample data, CollectionView
- Json 파싱을 통한 sample data 생성
- sample data를 이용한 CollectionView 생성
![Simulator Screen Shot - iPhone 11 - 2021-01-26 at 18 41 24](https://user-images.githubusercontent.com/28801805/105828963-1c412100-6007-11eb-9a66-73566e156b1b.png)
![Simulator Screen Shot - iPad (7th generation) - 2021-01-26 at 18 41 14](https://user-images.githubusercontent.com/28801805/105828967-1d724e00-6007-11eb-9e00-cd435a1a8f2b.png)


4. separate CollectionView, make EnumClass
- CollectionView 객체 분리
- EnumClass.VideoType을 통한 segmentControl 접근


5. modify TVData Model, make CollectionView Presen
- SampleData -> TVData로 변경, 접근제어자 설정
- CollectionView에 대한 Present Class 생성, 해당 클래스에서 날짜/시간 계산
