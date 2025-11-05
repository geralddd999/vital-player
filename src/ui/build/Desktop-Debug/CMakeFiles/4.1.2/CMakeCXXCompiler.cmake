set(CMAKE_CXX_COMPILER "/run/current-system/sw/bin/g++")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "GNU")
set(CMAKE_CXX_COMPILER_VERSION "14.3.0")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "17")
set(CMAKE_CXX_EXTENSIONS_COMPUTED_DEFAULT "ON")
set(CMAKE_CXX_STANDARD_LATEST "26")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20;cxx_std_23;cxx_std_26")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")
set(CMAKE_CXX23_COMPILE_FEATURES "cxx_std_23")
set(CMAKE_CXX26_COMPILE_FEATURES "cxx_std_26")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_CXX_COMPILER_APPLE_SYSROOT "")
set(CMAKE_CXX_SIMULATE_VERSION "")
set(CMAKE_CXX_COMPILER_ARCHITECTURE_ID "x86_64")



set(CMAKE_AR "/run/current-system/sw/bin/ar")
set(CMAKE_CXX_COMPILER_AR "/nix/store/ffrg0560kj0066s4k9pznjand907nlnz-gcc-14.3.0/bin/gcc-ar")
set(CMAKE_RANLIB "/run/current-system/sw/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "/nix/store/ffrg0560kj0066s4k9pznjand907nlnz-gcc-14.3.0/bin/gcc-ranlib")
set(CMAKE_LINKER "/run/current-system/sw/bin/ld")
set(CMAKE_LINKER_LINK "")
set(CMAKE_LINKER_LLD "")
set(CMAKE_CXX_COMPILER_LINKER "/nix/store/87zpmcmwvn48z4lbrfba74b312h22s6c-binutils-wrapper-2.44/bin/ld")
set(CMAKE_CXX_COMPILER_LINKER_ID "GNU")
set(CMAKE_CXX_COMPILER_LINKER_VERSION 2.44)
set(CMAKE_CXX_COMPILER_LINKER_FRONTEND_VARIANT GNU)
set(CMAKE_MT "")
set(CMAKE_TAPI "CMAKE_TAPI-NOTFOUND")
set(CMAKE_COMPILER_IS_GNUCXX 1)
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;mpp;CPP;ixx;cppm;ccm;cxxm;c++m)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang IN ITEMS C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)
set(CMAKE_CXX_LINKER_DEPFILE_SUPPORTED TRUE)
set(CMAKE_LINKER_PUSHPOP_STATE_SUPPORTED TRUE)
set(CMAKE_CXX_LINKER_PUSHPOP_STATE_SUPPORTED TRUE)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/nix/store/1fjc9wjx9y47fzkjdjpjwcqcx45q2dyl-libxml2-2.15.0-dev/include;/nix/store/12dym0l2sb5qj98nk8q47cim5iav3z4n-libxslt-1.1.43-dev/include;/nix/store/4vm27ldxmphlgyj3vf1h7dlgvj5hvj0w-openssl-3.6.0-dev/include;/nix/store/9hpipw45rkdfd37nzsi644c0s4gd3bbn-sqlite-3.50.4-dev/include;/nix/store/hwqbid7b85dfdvyj0ckgi2c6a4ir653q-zlib-1.3.1-dev/include;/nix/store/zxd9sjrf10s65hfxrb08027bajplg5ks-libglvnd-1.7.0-dev/include;/nix/store/icyb0ffm7i4sajzphnf818firkqlx71h-vulkan-headers-1.4.328.0/include;/nix/store/izaxd55idp7vqyxsw8kci0y4d12zbc7h-harfbuzz-12.1.0-dev/include;/nix/store/xpwg3r0dcmn431h2ms1j0zq66ag3qsb7-graphite2-1.3.14-dev/include;/nix/store/jawdm8mqgnadv7daprh2315asb7lgyr7-icu4c-76.1-dev/include;/nix/store/mfnqd0l258v2vdyxynbw2dq129z7sad3-libjpeg-turbo-3.1.2-dev/include;/nix/store/1hkdki45cpkpkmszjm3mafac1igj6qyf-libpng-apng-1.6.50-dev/include;/nix/store/7f7jxszkvdpwp3y6py3mfhmm8nsh72zl-pcre2-10.46-dev/include;/nix/store/v12k3k3nbhhqmwcvzbsljr135wbrwnsr-zstd-1.5.7-dev/include;/nix/store/gcszgyxbhhiyj2fv0linzhrs6nmcpd0k-libb2-0.98.1/include;/nix/store/w1l39gkqm6h5rphi113r4jkqk8hd7d7x-md4c-0.5.2-dev/include;/nix/store/rskzdih66z6x4sw8sji3n37jl84gh8fw-double-conversion-3.3.1/include;/nix/store/bd8bk81ncid8f2c5hg257dcwgjg66897-libproxy-0.5.11-dev/include;/nix/store/n90ph158nyi3m13ckawyall5sxylmmgd-dbus-1.14.10-dev/include;/nix/store/dhbbj5vc315ryrbq8vakb9sr4c8cb7jb-expat-2.7.3-dev/include;/nix/store/ly2cp9lbsbds7qkn04098svwc5m64yvv-glib-2.84.4-dev/include;/nix/store/z0hijbjl01x3xwqwmabddhj7l9nm7zy5-libffi-3.5.2-dev/include;/nix/store/m5zldis61kjiylqpxf7jaxs0jsmfq6j4-gettext-0.25.1/include;/nix/store/lbf3iacxyxkspzaq63shy7pb7lnqabw0-glibc-iconv-2.40/include;/nix/store/ci8l1pnw5j8iz0bkkxzj70ycchqkp3dr-unixODBC-2.3.12/include;/nix/store/ivc4nz7212q3jx326pr07gx5smjw5h5g-mariadb-connector-odbc-3.2.6/include;/nix/store/31x2j1zsjl2cyq6vx9bvfc1y5169ql21-systemd-258-dev/include;/nix/store/9yplk973zq742fxf39gh4s39c2p9nn3w-util-linux-2.41.2-dev/include;/nix/store/98g8c0wb6kfp72qwq02mwydr2s5zq336-mtdev-1.1.7/include;/nix/store/kh5x469fyqyjfpf48czwz2zhams5wg3w-lksctp-tools-1.0.21/include;/nix/store/diz6m0dq130nhc958a785hv7yfla840h-libselinux-3.8.1-dev/include;/nix/store/zgx0hlipp23mmb52jfan976d7kjc5aln-libsepol-3.8.1-dev/include;/nix/store/0cbbh42c3bgbryibp9h9aj3ljssia0b3-lttng-ust-2.14.0-dev/include;/nix/store/c02bl1qb1zbwidysz74yg9cicysgjak5-liburcu-0.15.3-dev/include;/nix/store/1k1r8n4drci4380pmpa1i8ds6lbrrwzl-libthai-0.1.29-dev/include;/nix/store/qy6wc8j2pnsi5hp7h8xrjy85a6fzs47d-libdrm-2.4.126-dev/include;/nix/store/1i90vxb1qizk37bjarnw8i2747hyzi87-mesa-libgbm-25.1.0/include;/nix/store/vyh9zfyw9wr0zhgyi0v27gdfbkvswfsp-libdatrie-2019-12-20-dev/include;/nix/store/fsbwpgmwyxaaam789r85qqqxqqh7agy1-systemd-minimal-libs-258-dev/include;/nix/store/ip8lx91f7w540zinadr4zk32xi1hq5ky-fontconfig-2.17.1-dev/include;/nix/store/104x1y8lq59bnmh71vcvym57grcdzc9b-freetype-2.13.3-dev/include;/nix/store/i20l7xn2a2yxdalwc2c8yp29dia5v2j7-bzip2-1.0.8-dev/include;/nix/store/r5dnrkpnds4xi52cdwakbjvvx049cj3x-brotli-1.1.0-dev/include;/nix/store/20q72vi8wdb7j6p9sdnpi32477j6nv2z-libx11-1.8.12-dev/include;/nix/store/nml7jra2yzxg133ssim80aj39f4668gc-xorgproto-2024.1/include;/nix/store/swamricxmcsgbc1lpmm5wrn40v206z2k-libxcomposite-0.4.6-dev/include;/nix/store/mq0lwzxs972sldhnplpdqa35638kdba8-libxfixes-6.0.2-dev/include;/nix/store/c70mx04ih0h6lnyqji8hgh7q1hgwcg59-libxext-1.3.6-dev/include;/nix/store/psd6a1kxjs4xyrqxy623s2948k0y5ash-libxau-1.0.12-dev/include;/nix/store/x4srm2fvqr2rnh4pc7sy43y4b0lgxc3h-libxi-1.8.2-dev/include;/nix/store/xgc6bxmjmsw5qd8yfr22cqc8x215j8cs-libxrender-0.9.12-dev/include;/nix/store/27czksni7m3kji791lvfdl40n99f71q8-libxcb-1.17.0-dev/include;/nix/store/anzq0yqha04vzs47v32nisyqf9dqak9j-libxkbcommon-1.11.0-dev/include;/nix/store/3a0jl8bl3rphxg11vkybhvfdmyych2r6-libxcb-util-0.4.1-dev/include;/nix/store/16cv4b2yhxbybksvbn9a4a0i4wjkks5g-libxcb-image-0.4.1-dev/include;/nix/store/mjj4638gwg2w5fli4a3qamgam9ykp259-libxcb-keysyms-0.4.1-dev/include;/nix/store/5800nal7ppwafblfhzcr9dr6507jylf4-libxcb-render-util-0.3.10-dev/include;/nix/store/lm7zhswyrln1krx9rs0nsix4g17dwkx1-libxcb-wm-0.4.2-dev/include;/nix/store/bzbl8b8rmn71m69rjmiw7vbynl23n4yq-libxdmcp-1.1.5-dev/include;/nix/store/c6ccfpn6zzjmdna716shx99q7wnb0qzz-libxtst-1.2.5/include;/nix/store/iild11xl0bzj8g9rwr4gifrnk7bgj3y2-libxcb-cursor-0.1.6-dev/include;/nix/store/i977dcix3zc1r4k0sb6s35576ghachlv-libepoxy-1.5.10-dev/include;/nix/store/rlmk68cdnpi4z13wf4q5y05xq66j502f-cups-2.4.14-dev/include;/nix/store/00qkznrigrh3axfkx2zlb9dxbf3p976m-gmp-with-cxx-6.3.0-dev/include;/nix/store/465lj8xn3vp4xfand16iqlwx1kqgc4id-wayland-1.24.0-dev/include;/nix/store/r7wdw4nkkjii690wwnzkgj68cg4shh2v-qtbase-6.10.0/include;/nix/store/0p46ymm9bizgirlnl8a4v0105d8zn9rw-qtlanguageserver-6.10.0/include;/nix/store/cnmx3qxzizqk4zl0z0x43jmbfnq3k4ci-qtshadertools-6.10.0/include;/nix/store/h987nkqyalnmrlp9k33hzcdc9vdalz9j-qtsvg-6.10.0/include;/nix/store/rz0lc8irp5knfzwakm86p3ifkflr1w1i-qtdeclarative-6.10.0/include;/nix/store/qld4r900hwnf2qq2pl6v1811zgpj4i51-qttools-6.10.0/include;/nix/store/xdzzv0inrp08flaq0zz2xzb4z3k514i5-qtcreator-17.0.2-dev/include;/nix/store/bdms3yvpgj3fz9lczq1kyk4m8zcs464i-sdl2-compat-2.32.56-dev/include;/nix/store/3f11y3cjb5h9smvzz5ddh8v5izgq4648-SDL2_mixer-2.8.1-dev/include;/nix/store/ddhz4d6x5vj9xixp4s3qpba1c63img84-flac-1.5.0-dev/include;/nix/store/hlk1bh4mb0ys0cgbv8frx6dyr55qws9i-fluidsynth-2.4.8-dev/include;/nix/store/ryp8vrq9441j58n9h197hb1vf1flvcx5-libogg-1.3.6-dev/include;/nix/store/hapzrckybdz0iizqvw36zp1v81qbzkq8-libvorbis-1.3.7-dev/include;/nix/store/hm37bd9xjzzl0p6wh17sfd7ncrg03rag-mpg123-1.33.3-dev/include;/nix/store/pa9sbb8lbwlqdj70bcr4k5ymxr259lcv-opusfile-0.12-dev/include;/nix/store/hpm4yd33fbw4j34gn2vgpks2l7vnn1iq-libopus-1.5.2-dev/include;/nix/store/s83kpjwkbxb6p0gmzplw7fbwl8r5w2aa-smpeg2-unstable-2022-05-26-dev/include;/nix/store/r91vmy9z9xy5fk3zvj5ii1cwd1wwy73l-wavpack-5.8.1-dev/include;/nix/store/l98q8kfs33qp99ranskn85gyzhf1knmx-libxmp-4.6.3-dev/include;/nix/store/r2xprs23w0xwl0ai3mp5xgf41zqpgjbc-game-music-emu-0.6.4/include;/nix/store/ffd05fd1mkprx1phcw603rvcnk75jb2m-ffmpeg-7.1.1-dev/include;/nix/store/iix0vgb47n72as5w2s6y4vn041dfkahc-gdb-16.3/include;/nix/store/wvym2k07jn0rci9w3fp1gw2ghym7qn5d-valgrind-3.25.1-dev/include;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/include/c++/14.3.0;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/include/c++/14.3.0/x86_64-unknown-linux-gnu;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/include/c++/14.3.0/backward;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0/include;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/include;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0/include-fixed;/nix/store/m3n0h7646c7qwf6dbvdqhslmxmv2dg3z-glibc-2.40-66-dev/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "stdc++;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/nix/store/avva5jz4vnkxxzdi8bbai3yq9476l69b-libxml2-2.15.0/lib;/nix/store/8d89g3ldfhigpdn9vhrdnwfv5rnx0dl3-libxslt-1.1.43/lib;/nix/store/llswcygvgv9x2sa3z6j7i0g5iqqmn5gn-openssl-3.6.0/lib;/nix/store/h6xv1avd5a55aa5c2d3cd069j7hlcv2y-sqlite-3.50.4/lib;/nix/store/z55x0q74zldi64iwamqf8wgrm2iza5rk-zlib-1.3.1/lib;/nix/store/as2rg79vk4z7frb7hy27nmadc3fp1a4j-libglvnd-1.7.0/lib;/nix/store/x7yh2n6g7km0rmkcx698f3fln05kk5wb-vulkan-loader-1.4.328.0/lib;/nix/store/r1mhx9z0ysd2kvlha5jd5h0bg448r53r-graphite2-1.3.14/lib;/nix/store/r8668cags6b1cmbf1x37clwknr0l6c16-harfbuzz-12.1.0/lib;/nix/store/1k32fplw8wsbc4rv7gs5yb3nlwds07yn-icu4c-76.1/lib;/nix/store/gdfk1rph83bvw311jq02br1zy2krcmaf-libjpeg-turbo-3.1.2/lib;/nix/store/x23lssxwyj35r3d3y1x12bs3xgg84jz5-libpng-apng-1.6.50/lib;/nix/store/2mxwf1zi8gxzmynnv9j903igzimmm8zj-pcre2-10.46/lib;/nix/store/mmfrs9gzbhrfgv12ff68a056yv942s21-zstd-1.5.7/lib;/nix/store/gcszgyxbhhiyj2fv0linzhrs6nmcpd0k-libb2-0.98.1/lib;/nix/store/fvgq4245sfq6d00mjm31vig7dbdrb3wg-md4c-0.5.2-lib/lib;/nix/store/rskzdih66z6x4sw8sji3n37jl84gh8fw-double-conversion-3.3.1/lib;/nix/store/6wbdigph6yib4q0biqr98kwcdm9vsq5g-libproxy-0.5.11/lib;/nix/store/86f8ip7shrdrrhwc12gqkspzn9vsd58m-expat-2.7.3/lib;/nix/store/1c663ln6chbg168dmri24z9nx6i9g65a-dbus-1.14.10-lib/lib;/nix/store/cyw33ds8cfwj1c6740llq1mzk4iinspp-libffi-3.5.2/lib;/nix/store/m5zldis61kjiylqpxf7jaxs0jsmfq6j4-gettext-0.25.1/lib;/nix/store/4z66ad4phbjkmkb8h0cyr6pls8q9l84a-glib-2.84.4/lib;/nix/store/ci8l1pnw5j8iz0bkkxzj70ycchqkp3dr-unixODBC-2.3.12/lib;/nix/store/i0idr097fg4i5nfs0pk4pxkp1x4zll9n-sqlite-connector-odbc-0.9993/lib;/nix/store/f8plklbbq3gwkq1wfq89i3f4wy8rabzn-systemd-258/lib;/nix/store/v42931s1sf8nxdrssqi1407dij051qc7-util-linux-2.41.2-lib/lib;/nix/store/98g8c0wb6kfp72qwq02mwydr2s5zq336-mtdev-1.1.7/lib;/nix/store/kh5x469fyqyjfpf48czwz2zhams5wg3w-lksctp-tools-1.0.21/lib;/nix/store/q7xpf2mw8n5x8gqmbjbm62b3m0wdv6wm-libselinux-3.8.1/lib;/nix/store/9xwqiwixzm5cfrg8gzakri5f0x5mn6jx-libsepol-3.8.1/lib;/nix/store/g21s2hd086gcbg3kmpdkhllrsg6f136a-liburcu-0.15.3/lib;/nix/store/qba3l0kvmlwkv7hrmgavw869z48axxap-lttng-ust-2.14.0/lib;/nix/store/slb4xicd377d1i8xhjmjy513wy2v123y-libthai-0.1.29/lib;/nix/store/3s2kbq3h0s5ysjacir21jj18q7zsggb5-libdrm-2.4.126/lib;/nix/store/1i90vxb1qizk37bjarnw8i2747hyzi87-mesa-libgbm-25.1.0/lib;/nix/store/zn3mn6wrp3waqyw67c4jm0janv765dg7-libdatrie-2019-12-20-lib/lib;/nix/store/vpjl3qrh47xmm79wbdl5ixas71wv5x3f-systemd-minimal-libs-258/lib;/nix/store/gpwlv1hsykscxws6h8r2cv17lkchpmwq-bzip2-1.0.8/lib;/nix/store/9qqi70nhacrdaq6i9063cszipizvgxvy-brotli-1.1.0-lib/lib;/nix/store/psvw7vs0h8kfggxjxlscsv8hl9189768-freetype-2.13.3/lib;/nix/store/37pqcmv5hn278m1anryngfnia3862iqc-fontconfig-2.17.1-lib/lib;/nix/store/0bhv7asksrwac04m9vjiqs2hdrm2jrc4-libx11-1.8.12/lib;/nix/store/9hx1q5ci61ixmrza4w2r4by2fp20p88v-libxfixes-6.0.2/lib;/nix/store/j7rzi5zr585pfk6mwgqrz48mmkyavsn9-libxcomposite-0.4.6/lib;/nix/store/0bzvfigj8g5fsl3vfclfmfqczzchqqgh-libxau-1.0.12/lib;/nix/store/pxamnydq8sd9jkrdwqwbl6viaz8lh3p9-libxext-1.3.6/lib;/nix/store/ha8dndbjyc5aq2krlm139hy1fh921bpa-libxi-1.8.2/lib;/nix/store/kms5qcvj9zvg5hb49mdydni5y7i7d1fz-libxrender-0.9.12/lib;/nix/store/cwlpvpbqfnc6hrjplk32y9alscragn21-libxcb-1.17.0/lib;/nix/store/drv82296paldrpih02xgs3rhdbfbbm0i-libxkbcommon-1.11.0/lib;/nix/store/qdnyhgch6x1k7x48rhwwmp33f77cms8n-libxcb-util-0.4.1/lib;/nix/store/sf8w62wmcsbidp27wz3d35yy4f4bqwdj-libxcb-image-0.4.1/lib;/nix/store/xc075n61qqsl0hh7ppc06y5sjs8llv9l-libxcb-keysyms-0.4.1/lib;/nix/store/s66a5gaflf2kvys2aa0hwfvzdhhndky6-libxcb-render-util-0.3.10/lib;/nix/store/vznydnw822k6yc90ib3yhabizpjvqw9g-libxcb-wm-0.4.2/lib;/nix/store/f43fvhams46s7adlapld7mwk2x2n2i2w-libxdmcp-1.1.5/lib;/nix/store/c6ccfpn6zzjmdna716shx99q7wnb0qzz-libxtst-1.2.5/lib;/nix/store/j0x4kjyp19ididk19fxsvjdwh5zdv75b-libxcb-cursor-0.1.6/lib;/nix/store/9a5cgg8a3b0gmr1gjhb55vcn969p619n-libepoxy-1.5.10/lib;/nix/store/sd9c9h940yv36386mvyq2vqmyv80qnsc-gmp-with-cxx-6.3.0/lib;/nix/store/d6spmgs7bvam7k32p15yx2wicr7cdf06-cups-2.4.14-lib/lib;/nix/store/sk1nyvzlzffrmk2xmy14rswyafhp7bz8-wayland-1.24.0/lib;/nix/store/r7wdw4nkkjii690wwnzkgj68cg4shh2v-qtbase-6.10.0/lib;/nix/store/0p46ymm9bizgirlnl8a4v0105d8zn9rw-qtlanguageserver-6.10.0/lib;/nix/store/cnmx3qxzizqk4zl0z0x43jmbfnq3k4ci-qtshadertools-6.10.0/lib;/nix/store/h987nkqyalnmrlp9k33hzcdc9vdalz9j-qtsvg-6.10.0/lib;/nix/store/rz0lc8irp5knfzwakm86p3ifkflr1w1i-qtdeclarative-6.10.0/lib;/nix/store/qld4r900hwnf2qq2pl6v1811zgpj4i51-qttools-6.10.0/lib;/nix/store/dpz3h60m1p5zvxzfa51vc9bm4bayjyvq-sdl2-compat-2.32.56/lib;/nix/store/wm4wszk9k1jsk0v1hx08scp9lkar231i-flac-1.5.0/lib;/nix/store/wznkb801d3x14w85l2kcdgmhpvb69892-fluidsynth-2.4.8/lib;/nix/store/pjsx5mlmaxg7y54j3wrgb6hm4xmp6asd-libogg-1.3.6/lib;/nix/store/q7w8ckvdjrr238nvvb4f4g0ismbj2016-libvorbis-1.3.7/lib;/nix/store/jk83f659lvdqp2p3gj3dzsxhfcjbpjld-mpg123-1.33.3/lib;/nix/store/mbv6dywix2napq4207jw8cbqm6r1a3v6-libopus-1.5.2/lib;/nix/store/9ns3rrkxhbsf8pxdf8q2i0b49i0dqbbs-opusfile-0.12/lib;/nix/store/r1s3dhsm8v42418g4np5104n6kp3zxha-smpeg2-unstable-2022-05-26/lib;/nix/store/d1svm8wm5066dkm11xpjnh334g4xybrs-wavpack-5.8.1/lib;/nix/store/wwfjjnbfpynjlk45bryh95bfgdawhjf8-libxmp-4.6.3/lib;/nix/store/r2xprs23w0xwl0ai3mp5xgf41zqpgjbc-game-music-emu-0.6.4/lib;/nix/store/b80hh4ka9bni03hrns5ipr9zhfh6wcwp-SDL2_mixer-2.8.1/lib;/nix/store/8dp4klblj660a9qv51903zzczv27k4l9-ffmpeg-7.1.1-lib/lib;/nix/store/iix0vgb47n72as5w2s6y4vn041dfkahc-gdb-16.3/lib;/nix/store/g8zyryr9cr6540xsyg4avqkwgxpnwj2a-glibc-2.40-66/lib;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0;/nix/store/dj06r96j515npcqi9d8af1d1c60bx2vn-gcc-14.3.0-lib/lib;/nix/store/87zpmcmwvn48z4lbrfba74b312h22s6c-binutils-wrapper-2.44/bin;/nix/store/8adzgnxs3s0pbj22qhk9zjxi1fqmz3xv-gcc-14.3.0/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
set(CMAKE_CXX_COMPILER_CLANG_RESOURCE_DIR "")

set(CMAKE_CXX_COMPILER_IMPORT_STD "")
### Imported target for C++23 standard library
set(CMAKE_CXX23_COMPILER_IMPORT_STD_NOT_FOUND_MESSAGE "Unsupported generator: Unix Makefiles")


### Imported target for C++26 standard library
set(CMAKE_CXX26_COMPILER_IMPORT_STD_NOT_FOUND_MESSAGE "Unsupported generator: Unix Makefiles")



