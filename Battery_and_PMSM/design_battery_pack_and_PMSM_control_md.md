# バッテリーパックとPMSMモーター制御を統合したシミュレーションの高速化
# 目的


[バッテリーセル96直列のバッテリーパックモデリング](../Battery_Pack/design_battery_pack_md.md)にて構築した、多数のバッテリーセルを組み合わせたバッテリーパックを、PMSMモーターインバーターシステムの電源として用いる。この時、大規模なシミュレーションモデルとなるため、「[Network Coupler](https://jp.mathworks.com/help/physmod/simscape/ug/using-network-couplers-to-split-physical-networks.html)」を用いて高速化を行う。


# 初期化

```matlab:Code
original_model_name = 'ipmsm_velocity_control_system';
couplered_model_name = 'ipmsm_velocity_control_system_coupler';
```

# バッテリーとPMSM


以下のコマンドを実行し、モデルを確認する。



```matlab:Code
open_system(original_model_name);
```



プラントモデルは、バッテリーパックを電源として、パックの直流電圧をインバーター（Converter ブロック）により三相交流に変換し、PMSMモーターに加えている。




このモデルはサンプリングタイムステップが5[<img src="https://latex.codecogs.com/gif.latex?\inline&space;\mu&space;s"/>]であり、シミュレーション時間は1[s]であるため、非常に計算時間がかかる。そこで、Network Coupler ブロックを用いてシミュレーションの高速化を行う。




以下のコマンドを実行し、元のモデルとの違いを確認する。



```matlab:Code
open_system(couplered_model_name);
```



こちらのモデルでは、バッテリーとインバーターの間に「Network Coupler (Voltage-Current)」が挿入されている。このブロックを用いることで、バッテリーとそれ以外のモデルのサンプリングタイムステップ、もしくはソルバーを切り分けることができる。




今回のシミュレーションではバッテリーのダイナミクスは遅くてよいもの考え、そのサンプリングタイムステップを10[ms]と設定した。




それぞれのモデルを実行し、シミュレーション時間と結果の違いを確認すること。


  


*Copyright 2022 The MathWorks, Inc.*



