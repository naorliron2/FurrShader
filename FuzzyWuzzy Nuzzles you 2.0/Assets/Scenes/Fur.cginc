
struct appdata {
	float4 vertex : POSITION;
	float3 normal : NORMAL;
	float2 uv : TEXCOORD0;

};
struct v2f {
	float4 vertex : SV_POSITION;
	float2 uv : TEXCOORD0;
	float3 worldNormal : NORMAL;
	float3 worldPos :POS;
};

float _Length;
fixed _Diffuse;
sampler2D _MainTex;
float4 _MainTex_ST;
sampler2D _FurTex;
float _Density;
float _Multiplier;
float _Rigidness;
float _Smoothness;

v2f furVert(appdata v) {
	v2f o;
	float3 pos = v.vertex.xyz + v.normal * _Length * FURSTEP;
	float4 gravity = float4(0, -1, 0, 0) * (1 - _Rigidness);
	pos += clamp(mul(unity_WorldToObject, gravity).xyz, -1, 1) * pow(FURSTEP, 3) * _Length;
	o.vertex = UnityObjectToClipPos(float4(pos, 1.0));
	o.uv = v.uv;
	o.worldNormal = UnityObjectToWorldNormal(v.normal);
	o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
	return o;
}
inline fixed4 LambertDiffuse(float3 worldNormal)
{
	float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
	float NdotL = max(0, dot(worldNormal, lightDir));
	return NdotL * _Diffuse;
}
fixed4 phongSpecular(float3 worldNormal,float3 worldPos) {
	float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
	float3 cameraDir = normalize(_WorldSpaceCameraPos - worldPos);
	float3 refVector = normalize(reflect( - lightDir, worldNormal));
	fixed3 VdotR = pow(saturate(dot(cameraDir, refVector)),_Smoothness);
	return fixed4(VdotR, 1);

}
v2f baseVert(appdata v)
{
	v2f o;
	o.vertex = UnityObjectToClipPos(v.vertex);
	o.uv = TRANSFORM_TEX(v.uv, _MainTex);
	o.worldNormal = UnityObjectToWorldNormal(v.normal);
	o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
	return o;
}

fixed4 baseFrag(v2f i) : SV_Target
{
	fixed4 col = tex2D(_MainTex, i.uv);
	col.rgb *= LambertDiffuse(normalize(i.worldNormal));
	return col + phongSpecular(normalize(i.worldNormal),i.worldPos);
}
fixed4 furFrag(v2f i) : SV_Target
{
	fixed alpha = tex2D(_FurTex, i.uv * _Multiplier).r;
	fixed3 albedo = baseFrag(i).rgb - pow(1 - FURSTEP, 3) *.1;
	alpha = clamp(alpha - pow(FURSTEP, 2) * _Density, 0, 1);
	return fixed4(albedo,alpha);
}
