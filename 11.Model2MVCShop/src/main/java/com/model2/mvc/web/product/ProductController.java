package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {;
	
    @Resource(name="uploadPath")
	private String uploadPath;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method =RequestMethod.GET)
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct :GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method = RequestMethod.POST)
	public String addProduct( @RequestParam("file") MultipartFile[] uploadFile, @ModelAttribute("product") Product product ) throws Exception {
	 
		
	    String fileMultiName = "";
	   
		System.out.println("/product/addProduct : POST");
		product.setManuDate(product.getManuDate().replace("-", ""));
		
		for(int i=0; i<uploadFile.length; i++) {
			
		String originalFilename = uploadFile[i].getOriginalFilename();
		
		File files = new File(uploadPath ,originalFilename);
		
		uploadFile[i].transferTo(files);
		
		if(i==0) { 
			fileMultiName += originalFilename; 	
	   	} 
		else{ 
		fileMultiName += "/"+originalFilename; }
		}
		
		product.setFileName(fileMultiName);
		
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo,  Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		Product product = productService.getProduct(prodNo);
	
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}

	@RequestMapping(value ="updateProductView", method=RequestMethod.GET)
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct: GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo , Model model) throws Exception{

		System.out.println("/product/updateProduct:GET");
	
		Product product = productService.getProduct(prodNo);
		product.setManuDate(product.getManuDate().replace("-", ""));
		model.addAttribute("product", product);
	
		return "forward:/product/getProduct.jsp";
	}
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("prodNo") Product product , Model model) throws Exception{

		System.out.println("/product/updateProduct:GET");
		product.setManuDate(product.getManuDate().replace("-", ""));
		productService.updateProduct(product);
		
		model.addAttribute("product", product);
	
		return "forward:/product/getProduct.jsp";
	}
	
	
	@RequestMapping( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct: GET/ POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		System.out.println("search"+search);
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}