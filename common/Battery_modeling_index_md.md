# Simscapeとバッテリー計測データを活用したモデリングソリューション


本サンプルモデルでは、リチウムイオンバッテリーの各種設計方法について、具体的な設計方法を紹介する。



   -  等価回路モデリングとパラメータ推定 
   -  バッテリーパックのモデリング 
   -  セルバランス制御の設計とコード生成 
   -  機械学習、深層学習を用いたバッテリー残寿命推定とアルゴリズムの実装 



モデルをダウンロード、もしくはクローンした後、最初に「Battery_modeling_in_simscape.prj」をダブルクリックして[プロジェクト](https://jp.mathworks.com/help/matlab/projects.html)を起動すること。


# 必要なツールボックス


本モデルでは、以下のツールボックスを利用する。ただし、インストールしていなくても、モデルを実行せず閲覧するだけであれば可能である。また、例題によっては使わないツールボックスもある。



   -  MATLAB® 
   -  Simulink® 
   -  Simulink Test™ 
   -  Simscape™, Simscape Electrical™ 
   -  Simulink Design Optimization™ 
   -  Optimization Toolbox™ 
   -  Statistics and Machine Learning Toolbox™ 
   -  Deep Learning Toolbox™ 
   -  MATLAB® Coder™, Simulink® Coder™, Embedded Coder® 

# 必要なサポートパッケージ

   -  MATLAB Coder Interface for Deep Learning Libraries 

# 目次
## パラメータ推定


[バッテリー等価回路のパラメーター推定](../Cell_characterization/design_battery_parameters_md.md)


## バッテリーパック


[バッテリーセル96直列のバッテリーパックモデリング](../Battery_Pack/design_battery_pack_md.md)


## セルバランス制御


[バッテリーパック充電時におけるパッシブバランス制御](../Passive_balancing/design_passive_balancing_md.md)


## 残寿命予測


[機械学習を用いたバッテリー サイクル寿命の予測](../RUL/predicting_battery_RUL_ML_md.md)




[深層学習を用いたバッテリー サイクル寿命の予測](../RUL/predicting_battery_RUL_DL_md.md)


  
# 応用編


以下のリンク先のデモモデルでは、バッテリーマネジメントシステム(BMS)のモデルベースデザインを行う方法を示している。Simulink Test を使ったテストケースの活用、Requirements Toolbox™ を使った要件の関連付けなどの応用的な手法も紹介されている。




[Design and Test Lithium Ion Battery Management Algorithms](https://jp.mathworks.com/matlabcentral/fileexchange/72865-design-and-test-lithium-ion-battery-management-algorithms)


  
# 過去バージョン


過去のバージョンのファイル一式は、以下から得ることができる。ただし、過去のモデルには、古い時期に作成したサンプルしか含まれていないことに注意すること。




GitHubからクローンしている場合には、以下の該当バージョンに戻すことで、過去バージョンファイルを得ることができる。


  


R2021b: [v1.2](https://github.com/mathworks/battery-modeling-solutions-with-simscape-and-measured-data/archive/refs/tags/v1.2.zip)


  


*Copyright 2022 The MathWorks, Inc.*



