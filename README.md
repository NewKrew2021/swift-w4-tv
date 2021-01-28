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


6. respond to various screen size
- 아이폰, 아이패드 / 가로, 세로에 따라 다른 컬렉션뷰 레이아웃 설정
![Simulator Screen Shot - iPad (7th generation) - 2021-01-28 at 16 29 28](https://user-images.githubusercontent.com/28801805/106104652-145bbb00-6186-11eb-9613-bfe7ce3de349.png)
![Simulator Screen Shot - iPad (7th generation) - 2021-01-28 at 16 29 30](https://user-images.githubusercontent.com/28801805/106104659-17ef4200-6186-11eb-8724-acf53dcef959.png)
![Simulator Screen Shot - iPhone 11 - 2021-01-28 at 16 29 52](https://user-images.githubusercontent.com/28801805/106104666-19b90580-6186-11eb-8983-a4411d76594d.png)
![Simulator Screen Shot - iPhone 11 - 2021-01-28 at 16 29 57](https://user-images.githubusercontent.com/28801805/106104676-1b82c900-6186-11eb-991b-b23a223c77e4.png)
![Simulator Screen Shot - iPad (7th generation) - 2021-01-28 at 16 29 30](https://user-images.githubusercontent.com/28801805/106104687-1e7db980-6186-11eb-9369-9119779165a7.png)
![Simulator Screen Shot - iPhone 11 - 2021-01-28 at 16 29 52](https://user-images.githubusercontent.com/28801805/106104702-22114080-6186-11eb-91db-54c3bc9ec8ba.png)
![Simulator Screen Shot - iPhone 11 - 2021-01-28 at 16 29 57](https://user-images.githubusercontent.com/28801805/106104707-23db0400-6186-11eb-8a10-2853287bfdd1.png)

