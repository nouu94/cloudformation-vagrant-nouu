# newsinsa-code-collection

<br>

## onpremise-vagrant 디렉토리 구성

onpremise-vagrant<br>

│  .htaccess # 워드프레스 웹 하위 폴더 진입 허용 설정 파일  <br>
│  db-configuration.sh # db서버 설정 쉘스크립트<br>
│  ssh_conf.sh # putty ssh 허용 관련 쉘스크립트<br>
│  vagrantFile<br>
│  web-configuration.sh # web서버 설정 쉘스크립트<br>
│  wp-config.php # 워드프레스 설정 파일<br>

위 파일을 이용하여 virtualbox에 vagrant 환경 구성을 하면 초기 워드프레스 설정 화면이 나옴.

![워드프레스](https://github.com/nouu94/newsinsa-code-collection/assets/71218142/b01586d6-5b58-43cd-83c1-61f69ea3c1e1)

<br>

<br>

## naver-shopping-crawlling-woocommerce-data-load 구성

naver-shopping-crawlling-woocommerce-data-load

│  naver-shopping.ipynb # 네이버 쇼핑 open api를 이용하여 우커머스 쇼핑몰 제품 등록, 30 ~ 60초 마다 회원 데이터 자동 적재

위 파일을 이용한 결과는 아래의 이미지와 같이 상품 데이터가 적재됨.

![result](https://github.com/nouu94/newsinsa-code-collection/assets/71218142/aeb9f0dd-12db-4657-835b-58761aff41a1)

<br>

<br>

## cloudformation 구성 파일

cloudformation

│  codenative-new-IaC-seoul.yaml # 서울 리전의 일부 서비스를 코드로 구현한 yaml파일<br>

![image](https://github.com/nouu94/newsinsa-code-collection/assets/71218142/75e6649f-6987-44ae-9549-9b0d3d18397d)

위와 같이 추후 다른 리전에도 사용할 수 있도록 다음과 같이 Az, InstanceAMI 등 파라미터를 다양하게 구성

<br>

![image](https://github.com/nouu94/newsinsa-code-collection/assets/71218142/4d345cf2-4e86-4114-9d3a-69769e0a1ca6)



위와 같이 불투명도가 100%인 서비스 코드 기반으로 구현.

-  VPC
- AuroraDB Cluster, reader, writer
- DMS
- EFS
- ECS TASK DEFINITION, CLUSTER
- ALB, TG
