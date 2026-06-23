#npyrandom

add_library( # Sets the name of the library.
        npyrandom

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/src/distributions/logfactorial.c
        ../numpy/random/src/distributions/distributions.c
        ../numpy/random/src/distributions/random_mvhg_count.c
        ../numpy/random/src/distributions/random_mvhg_marginals.c
        ../numpy/random/src/distributions/random_hypergeometric.c
        )

target_include_directories(npyrandom PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        npyrandom

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#npymath

add_library( # Sets the name of the library.
        npymath

        # Sets the library as a shared library.
        SHARED
        ./core/src/npymath/npy_math.c
        ./core/src/npymath/ieee754.c
        ./core/src/npymath/npy_math_complex.c
        ./core/src/npymath/halffloat.c
        )

target_include_directories(npymath PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/include/numpy/
        )

target_link_libraries( # Specifies the target library.
        npymath

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )


#_multiarray_umath

add_library( # Sets the name of the library.
        _multiarray_umath

        # Sets the library as a shared library.
        SHARED
        ./core/src/npysort/x86-qsort.dispatch.avx512_skx.cpp
        ./core/src/multiarray/argfunc.dispatch.avx512_skx.c
        ./core/src/umath/loops_arithmetic.dispatch.avx512_skx.c
        ./core/src/umath/loops_minmax.dispatch.avx512_skx.c
        ./core/src/umath/loops_umath_fp.dispatch.avx512_skx.c
        ./core/src/umath/loops_exponent_log.dispatch.avx512_skx.c
        ./core/src/umath/loops_comparison.dispatch.avx512_skx.c
        ./core/src/umath/loops_hyperbolic.dispatch.avx512_skx.c
        ./core/src/multiarray/argfunc.dispatch.avx2.c
        ./core/src/umath/loops_arithm_fp.dispatch.avx2.c
        ./core/src/umath/loops_arithmetic.dispatch.avx2.c
        ./core/src/umath/loops_minmax.dispatch.avx2.c
        ./core/src/umath/loops_comparison.dispatch.avx2.c
        ./core/src/multiarray/argfunc.dispatch.sse42.c
        ./core/src/umath/loops_comparison.dispatch.sse42.c
        ./core/src/multiarray/argfunc.dispatch.c
        ./core/src/umath/loops_unary_fp.dispatch.c
        ./core/src/umath/loops_arithm_fp.dispatch.c
        ./core/src/umath/loops_arithmetic.dispatch.c
        ./core/src/umath/loops_minmax.dispatch.c
        ./core/src/umath/loops_trigonometric.dispatch.c
        ./core/src/umath/loops_umath_fp.dispatch.c
        ./core/src/umath/loops_exponent_log.dispatch.c
        ./core/src/umath/loops_hyperbolic.dispatch.c
        ./core/src/umath/loops_comparison.dispatch.c
        ./core/src/umath/loops_unary_fp.dispatch.sse41.c
        ./core/src/umath/loops_arithmetic.dispatch.sse41.c
        ./core/src/umath/loops_arithm_fp.dispatch.avx512f.c
        ./core/src/umath/loops_trigonometric.dispatch.avx512f.c
        ./core/src/umath/loops_arithmetic.dispatch.avx512f.c
        ./core/src/umath/loops_exponent_log.dispatch.avx512f.c
        ./core/src/umath/loops_comparison.dispatch.avx512f.c
        ./core/src/umath/loops_trigonometric.dispatch.fma3.avx2.c
        ./core/src/umath/loops_exponent_log.dispatch.fma3.avx2.c
        ./core/src/umath/loops_hyperbolic.dispatch.fma3.avx2.c
        ./core/src/umath/loops_modulo.dispatch.c
        ./core/src/multiarray/abstractdtypes.c
        ./core/src/multiarray/alloc.c
        ./core/src/multiarray/arrayobject.c
        ./core/src/multiarray/arraytypes.c
        ./core/src/multiarray/array_assign_scalar.c
        ./core/src/multiarray/array_method.c
        ./core/src/multiarray/array_coercion.c
        ./core/src/multiarray/array_assign_array.c
        ./core/src/multiarray/arrayfunction_override.c
        ./core/src/multiarray/buffer.c
        ./core/src/multiarray/calculation.c
        ./core/src/multiarray/compiled_base.c
        ./core/src/multiarray/common.c
        ./core/src/multiarray/common_dtype.c
        ./core/src/multiarray/convert.c
        ./core/src/multiarray/convert_datatype.c
        ./core/src/multiarray/conversion_utils.c
        ./core/src/multiarray/ctors.c
        ./core/src/multiarray/datetime.c
        ./core/src/multiarray/datetime_strings.c
        ./core/src/multiarray/datetime_busday.c
        ./core/src/multiarray/datetime_busdaycal.c
        ./core/src/multiarray/descriptor.c
        ./core/src/multiarray/dlpack.c
        ./core/src/multiarray/dtypemeta.c
        ./core/src/multiarray/dragon4.c
        ./core/src/multiarray/dtype_transfer.c
        ./core/src/multiarray/einsum.c
        ./core/src/multiarray/einsum_sumprod.c
        ./core/src/multiarray/experimental_public_dtype_api.c
        ./core/src/multiarray/flagsobject.c
        ./core/src/multiarray/getset.c
        ./core/src/multiarray/hashdescr.c
        ./core/src/multiarray/item_selection.c
        ./core/src/multiarray/iterators.c
        ./core/src/multiarray/legacy_dtype_implementation.c
        ./core/src/multiarray/lowlevel_strided_loops.c
        ./core/src/multiarray/mapping.c
        ./core/src/multiarray/methods.c
        ./core/src/multiarray/multiarraymodule.c
        ./core/src/multiarray/nditer_templ.c
        ./core/src/multiarray/nditer_api.c
        ./core/src/multiarray/nditer_constr.c
        ./core/src/multiarray/nditer_pywrap.c
        ./core/src/multiarray/number.c
        ./core/src/multiarray/refcount.c
        ./core/src/multiarray/sequence.c
        ./core/src/multiarray/shape.c
        ./core/src/multiarray/scalarapi.c
        ./core/src/multiarray/scalartypes.c
        ./core/src/multiarray/strfuncs.c
        ./core/src/multiarray/temp_elide.c
        ./core/src/multiarray/typeinfo.c
        ./core/src/multiarray/usertypes.c
        ./core/src/multiarray/vdot.c
        ./core/src/multiarray/textreading/conversions.c
        ./core/src/multiarray/textreading/field_types.c
        ./core/src/multiarray/textreading/growth.c
        ./core/src/multiarray/textreading/readtext.c
        ./core/src/multiarray/textreading/rows.c
        ./core/src/multiarray/textreading/stream_pyobject.c
        ./core/src/multiarray/textreading/str_to_int.c
        ./core/src/npymath/arm64_exports.c
        ./core/src/umath/umathmodule.c
        ./core/src/umath/reduction.c
        ./core/src/umath/loops.c
        ./core/src/umath/matmul.c
        ./core/src/umath/dispatching.c
        ./core/src/umath/legacy_array_method.c
        ./core/src/umath/wrapping_array_method.c
        ./core/src/umath/ufunc_object.c
        ./core/src/umath/extobj.c
        ./core/src/umath/scalarmath.c
        ./core/src/umath/ufunc_type_resolution.c
        ./core/src/umath/override.c
        ./core/src/umath/_scaled_float_dtype.c
        ./core/src/common/array_assign.c
        ./core/src/common/mem_overlap.c
        ./core/src/common/npy_argparse.c
        ./core/src/common/npy_hashtable.c
        ./core/src/common/npy_longdouble.c
        ./core/src/common/ucsnarrow.c
        ./core/src/common/ufunc_override.c
        ./core/src/common/numpyos.c
        ./core/src/common/npy_cpu_features.c
        ./core/src/npysort/quicksort.cpp
        ./core/src/npysort/mergesort.cpp
        ./core/src/npysort/heapsort.cpp
        ./core/src/npysort/timsort.cpp
        ./core/src/npysort/radixsort.cpp
        ./core/src/npysort/selection.cpp
        ./core/src/npysort/binsearch.cpp
        ./core/src/multiarray/textreading/tokenize.cpp
        ./core/src/umath/clip.cpp
        ./core/src/umath/string_ufuncs.cpp
        )

target_include_directories(_multiarray_umath PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include
        ./core/include/numpy
        ./core/src/multiarray
        ./core/src/umath
        )

target_link_libraries( # Specifies the target library.
        _multiarray_umath

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npyrandom
        npymath
        )


#_multiarray_tests

add_library( # Sets the name of the library.
        _multiarray_tests

        # Sets the library as a shared library.
        SHARED
        ./core/src/multiarray/_multiarray_tests.c
        ./core/src/common/mem_overlap.c
        ./core/src/common/npy_argparse.c
        ./core/src/common/npy_hashtable.c
        )

target_include_directories(_multiarray_tests PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/include/numpy
        ./core/src/multiarray
        )

target_link_libraries( # Specifies the target library.
        _multiarray_tests

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npymath
        )


#_operand_flag_tests

add_library( # Sets the name of the library.
        _operand_flag_tests

        # Sets the library as a shared library.
        SHARED
        ../numpy/core/src/umath/_operand_flag_tests.c
        )

target_include_directories(_operand_flag_tests PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _operand_flag_tests

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_rational_tests

add_library( # Sets the name of the library.
        _rational_tests

        # Sets the library as a shared library.
        SHARED
        ./core/src/umath/_rational_tests.c
        )

target_include_directories(_rational_tests PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/src/multiarray/
        )

target_link_libraries( # Specifies the target library.
        _rational_tests

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_simd

add_library( # Sets the name of the library.
        _simd

        # Sets the library as a shared library.
        SHARED
        ./core/src/_simd/_simd.dispatch.avx512_skx.c
        ./core/src/_simd/_simd.dispatch.avx512f.c
        ./core/src/_simd/_simd.dispatch.fma3.avx2.c
        ./core/src/_simd/_simd.dispatch.sse42.c
        ./core/src/_simd/_simd.dispatch.c
        ../numpy/core/src/_simd/_simd.c
        ../numpy/core/src/common/npy_cpu_features.c
        )

target_include_directories(_simd PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _simd

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npymath
        )

#_struct_ufunc_tests

add_library( # Sets the name of the library.
        _struct_ufunc_tests

        # Sets the library as a shared library.
        SHARED
        ./core/src/umath/_struct_ufunc_tests.c
        )

target_include_directories(_struct_ufunc_tests PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _struct_ufunc_tests

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_umath_tests

add_library( # Sets the name of the library.
        _umath_tests

        # Sets the library as a shared library.
        SHARED
        ./core/src/umath/_umath_tests.dispatch.avx2.c
        ./core/src/umath/_umath_tests.dispatch.sse41.c
        ../numpy/core/src/umath/_umath_tests.dispatch.c
        ./core/src/umath/_umath_tests.c
        ../numpy/core/src/common/npy_cpu_features.c
        )

target_include_directories(_umath_tests PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/include/numpy/
        )

target_link_libraries( # Specifies the target library.
        _umath_tests

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npymath
        )

#_pocketfft_internal

add_library( # Sets the name of the library.
        _pocketfft_internal

        # Sets the library as a shared library.
        SHARED
        ../numpy/fft/_pocketfft.c
        )

target_include_directories(_pocketfft_internal PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/include/numpy/
        )

target_link_libraries( # Specifies the target library.
        _pocketfft_internal

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#lapack_lite

add_library( # Sets the name of the library.
        lapack_lite

        # Sets the library as a shared library.
        SHARED
        ../numpy/linalg/lapack_litemodule.c
        ../numpy/linalg/lapack_lite/python_xerbla.c
        ../numpy/linalg/lapack_lite/f2c_z_lapack.c
        ../numpy/linalg/lapack_lite/f2c_c_lapack.c
        ../numpy/linalg/lapack_lite/f2c_d_lapack.c
        ../numpy/linalg/lapack_lite/f2c_s_lapack.c
        ../numpy/linalg/lapack_lite/f2c_lapack.c
        ../numpy/linalg/lapack_lite/f2c_blas.c
        ../numpy/linalg/lapack_lite/f2c_config.c
        ../numpy/linalg/lapack_lite/f2c.c
        )

target_include_directories(lapack_lite PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        lapack_lite

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_umath_linalg

add_library( # Sets the name of the library.
        _umath_linalg

        # Sets the library as a shared library.
        SHARED
        ../numpy/linalg/umath_linalg.cpp
        )

target_include_directories(_umath_linalg PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ./core/include/numpy/
        )

target_link_libraries( # Specifies the target library.
        _umath_linalg

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npymath
        F:/FreeProjects/android/OpenBlas/app/.cxx/cmake/release/arm64-v8a/lib/libopenblas.a
        lapack_lite
        )

#_pcg64

add_library( # Sets the name of the library.
        _pcg64

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_pcg64.c
        ../numpy/random/src/pcg64/pcg64.c
        )

target_include_directories(_pcg64 PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _pcg64

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_philox

add_library( # Sets the name of the library.
        _philox

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_philox.c
        ../numpy/random/src/philox/philox.c
        )

target_include_directories(_philox PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _philox

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_sfc64

add_library( # Sets the name of the library.
        _sfc64

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_sfc64.c
        ../numpy/random/src/sfc64/sfc64.c
        )

target_include_directories(_sfc64 PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _sfc64

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_mt19937

add_library( # Sets the name of the library.
        _mt19937

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_mt19937.c
        ../numpy/random/src/mt19937/mt19937.c
        ../numpy/random/src/mt19937/mt19937-jump.c
        )

target_include_directories(_mt19937 PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _mt19937

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#mtrand

add_library( # Sets the name of the library.
        mtrand

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/mtrand.c
        ../numpy/random/src/legacy/legacy-distributions.c
        ../numpy/random/src/distributions/distributions.c
        )

target_include_directories(mtrand PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        ../numpy/random
        )

target_link_libraries( # Specifies the target library.
        mtrand

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#bit_generator

add_library( # Sets the name of the library.
        bit_generator

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/bit_generator.c
        )

target_include_directories(bit_generator PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        bit_generator

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )

#_bounded_integers

add_library( # Sets the name of the library.
        _bounded_integers

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_bounded_integers.c
        )

target_include_directories(_bounded_integers PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _bounded_integers

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npyrandom
        )

#_generator

add_library( # Sets the name of the library.
        _generator

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_generator.c
        )

target_include_directories(_generator PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _generator

        # Links the target library to the log library
        # included in the NDK.
        cpython
        npyrandom
        )

#_common

add_library( # Sets the name of the library.
        _common

        # Sets the library as a shared library.
        SHARED
        ../numpy/random/_common.c
        )

target_include_directories(_common PUBLIC
        ./core/include
        ./core/src/common
        ../numpy/distutils/include/
        )

target_link_libraries( # Specifies the target library.
        _common

        # Links the target library to the log library
        # included in the NDK.
        cpython
        )