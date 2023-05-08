package com.windshop.phone.service.impl;

import com.windshop.phone.entity.Product;
import com.windshop.phone.entity.ProductImage;
import com.windshop.phone.model.ProductSellerDto;
import com.windshop.phone.repository.ProductRepository;
import com.windshop.phone.service.IProductService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements IProductService {

    private static final String ROOT_PATH = "E:\\wind-shop_Doan\\upload\\";

    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    private ProductRepository productRepository;

    private boolean isEmptyUploadFile(MultipartFile[] images) {
        if (images == null || images.length <= 0)
            return true;
        if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
            return true;
        return false;
    }

    @Override
    public void save(MultipartFile[] productImages, Product product) throws IOException {
        if (product.getId() != null) { // chỉnh sửa
            // lấy dữ liệu cũ của sản phẩm
            Product productInDb = productRepository.findById(product.getId()).get();
            product.setCreatedDate(productInDb.getCreatedDate());
            product.setUpdatedDate(LocalDateTime.now());
            if (!isEmptyUploadFile(productImages)) { // nếu admin sửa ảnh sản phẩm
                // lấy danh sách ảnh cũ của sản phẩm
                List<ProductImage> oldProductImage = productInDb.getProductImages();

                // xoá ảnh cũ trên vật lí(host)
                for (ProductImage _images : oldProductImage) {
                    new File(ROOT_PATH + _images.getPath()).delete();
                }

                // xoá ảnh trên database
                product.removeProductImages();

            } else { // ảnh phải giữ nguyên
                product.setProductImages(productInDb.getProductImages());
            }

        } else {
            product.setCreatedDate(LocalDateTime.now());

        }

        if (!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
            for (MultipartFile productImage : productImages) {

                // lưu vật lí
                productImage.transferTo(new File(
                        ROOT_PATH + productImage.getOriginalFilename()));

                ProductImage _productImages = new ProductImage();
                _productImages.setPath(productImage.getOriginalFilename());
                _productImages.setTitle(productImage.getOriginalFilename());
                product.addProductImages(_productImages);
            }
        }

        productRepository.save(product);
    }

    @Override
    public Page<Product> pageProduct(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public Page<Product> shopProduct(Pageable pageable) {
        return productRepository.findAllByStatus(1, pageable);
    }

    public Page<Product> pageProductByBrand(Integer brandId, Pageable pageable) {
        return productRepository.findAllByBrandIdAndStatus(brandId, 1, pageable);
    }

    public Page<Product> pageProductByCategory(Integer categoryId, Pageable pageable) {
        return productRepository.findAllByCategoryIdAndStatus(categoryId, 1, pageable);
    }

    @SuppressWarnings("unchecked")
    public List<Product> filter(Integer price) {
        String sql = "select * from tbl_product where 1=1 and status = 1";
        if (ObjectUtils.isNotEmpty(price)) {
            if (price == 5) {
                sql += " AND price < 5000000";
            }
            if (price == 7) {
                sql += " AND price >= 5000000 and price < 7000000";
            }
            if (price == 12) {
                sql += " AND price >= 7000000 and price < 12000000";
            }
            if (price == 13) {
                sql += " AND price >= 12000000";
            }
        }
        Query query = entityManager.createNativeQuery(sql, Product.class);
        return query.getResultList();
    }

    @Override
    public Optional<Product> findById(Integer id) {
        return productRepository.findById(id);
    }
}
